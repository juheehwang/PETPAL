package com.nobanryeo.petpal.admin.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.dto.ReportDTO;
import com.nobanryeo.petpal.admin.dto.ReportDetailDTO;
import com.nobanryeo.petpal.admin.dto.reportPopupDTO;
import com.nobanryeo.petpal.admin.report.service.ReportService;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.adopt.service.MissingService;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

@Controller
@RequestMapping("/admin/*")  
public class ReportController {
	private final AdoptService adoptService; 
	private final MissingService missingService;
	private final ReportService reportService;
	
	@Autowired
	public ReportController(ReportService reportService,AdoptService adoptService,MissingService missingService) {
		this.adoptService = adoptService;
		this.missingService = missingService;
		this.reportService = reportService;
	}
	
    @RequestMapping("reportList")
    public String reportList(Model model , AdminPageInfoDTO paging,
            @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
            , @RequestParam(value="category", required=false)String category
            , @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue
            , @RequestParam(value="sortValue", required=false)String sortValue) {
       
    	// ?????????????????? ????????? ?????????
    	 if (nowPage == null && cntPerPage == null) {
             nowPage = "1";
             cntPerPage = "5";
          } else if (nowPage == null) {
             nowPage = "1";
          } else if (cntPerPage == null) { 
             cntPerPage = "5";
          }
    	if(category == null) {
    		category = "0";
    	}
    	
    	// ????????? ????????? ?????? ??????????????????
    	if(searchValue == null) {
    		int total = 0;
    		
    		// ??????????????? ??????????????? ??????????????? ?????? ??? ???????????? ??????????????? ????????? DTO??? ??????
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
      	    total = reportService.selectReportCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            
            // ????????? DTO??? ???????????? ????????? ???????????? jsp??? ?????????
            List<ReportDTO> reportList = reportService.selectReport(paging);
        	System.out.println(reportList);
        	model.addAttribute("total",total);
            model.addAttribute("reportList", reportList);
            
    	}else {
    		// ????????? ???????????? ?????????
    		int total = 0;
    		// ??????????????? ??????????????? ?????? ????????????, ????????? ?????? ??????????????? ?????? ??? ???????????? ??????????????? ????????? DTO??? ??????
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
      	    total = reportService.selectReportCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,searchCondition,searchValue,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            model.addAttribute("searchCondition", searchCondition);
            model.addAttribute("searchValue", searchValue);
            
         // ????????? DTO??? ???????????? ????????? ???????????? jsp??? ?????????
            List<ReportDTO> reportList = reportService.selectReport(paging);
        	System.out.println(reportList);
        	model.addAttribute("total",total);
            model.addAttribute("reportList", reportList);
    		
    		
    	}
    	

       return "admin/main/report";
    }
    
    @RequestMapping("reportDetail")
    public String reportDetail(Model model, @RequestParam(value="category", required=false)String category
    		,@RequestParam(value="reportCode", required=false)String reportCode) {
       
       if(category == null) {
   		category = "0";
   	}
       Map param = new HashMap();
       
       param.put("reportCode", reportCode);
       param.put("category", category);
       ReportDetailDTO reportDetail = reportService.selectReportDetail(param);
       System.out.println(reportDetail);
       
       model.addAttribute("reportDetail",reportDetail);
       model.addAttribute("category",category);
       model.addAttribute("reportCode",reportCode);


       return "admin/main/report_detail";
    }
    
    
    @RequestMapping("updateDecision")
    public String updateDecision(Model model
    		,@RequestParam(value="reportCode", required=false)String reportCode
    		,@RequestParam(value="decision", required=false)String decision
    		,@RequestParam(value="message", required=false)String message
    		,@RequestParam(value="category", required=false)String category
    		,@RequestParam(value="boardCode", required=false)String boardCode
    		,HttpServletRequest request) {
       
    	HttpSession session = request.getSession();
		session.getAttribute("loginUser");
	    System.out.println("?????? ?????? : " + session);
	    UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("loginUser"); // ?????? ???????????? ???????????? ??????????????? UserInfoDTO??? ?????????
	    int code = userInfo.getCode();
	    System.out.println("????????? ?????? ?????? : " + code);
	    System.out.println("reportCode"+reportCode);
	    System.out.println("decision"+decision);
	    
       if(decision.equals("2")) { // ????????? ??????????????????
    	   System.out.println("?????????");
    	   System.out.println("boardCode"+boardCode);
    	   
    	   // ???????????? ?????????????????? ?????? ???????????? ?????? ???????????? ??????????????? ?????????????????? ??????????????????, ????????? ????????????, ???????????? ??????????????? DecisionDTO??? ?????????
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, Integer.parseInt(reportCode),category,boardCode);
    	   if(reportService.insertDecision(decisionData) == true) { // DecisionDTO??? ???????????? DECISION_TABLE??? ??????????????? INSERT??????
    		   System.out.println("insert ??????");
    		   if(reportService.updateReport(decisionData) == true) { // INSERT??? DECISION_TABLE??? PK??? ?????????????????? DECISION_CODE??? UPDATE??????
    			   System.out.println("update ??????");
    			   if(reportService.updateBoardBlind(decisionData) == true) { // ?????? ????????? ???????????? ??????????????? Y?????? N?????? ?????????
    				   System.out.println("????????? ???????????? ??????");
    				   if(reportService.updateUserBan(decisionData) == true) { // ?????? ????????? ???????????? ????????? ????????? ?????????????????? 1 ?????????. 3????????? ????????? ??????
    					   System.out.println("?????? ??????????????? update ??????");
    				   }else {
        				   System.out.println("?????? ??????????????? update ??????");
        			   }
    			   }else {
    				   System.out.println("???????????? ??????");
    			   }
    		   }else {
    			   System.out.println("update ??????");
    		   }
    	   }else {
    		   System.out.println("insert ??????");
    	   }
       }else { //??????
    	   
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, Integer.parseInt(reportCode),category,boardCode);
    	   if(reportService.insertDecision(decisionData) == true) {
    		   System.out.println("insert ??????");
    		   if(reportService.updateReport(decisionData) == true) {
    			   System.out.println("update??????");
    		   }else {
    			   System.out.println("update??????");
    		   }
    	   }else {
    		   System.out.println("insert ??????");

    	   }
       }
	    
	    
       model.addAttribute("reportCode",reportCode);
       model.addAttribute("category",category);

       return "redirect:/admin/reportDetail?reportCode={reportCode}&category={category}";
    }
    
    @RequestMapping("reportPopup")
    public String reportPopup(Model model,
            @RequestParam(value="boardCode", required=false) int boardCode,
            @RequestParam(value="category", required=false)String category) {
    	
    	System.out.println(category+"////"+boardCode);
    	Map param = new HashMap();
        
        param.put("boardCode", boardCode);
        param.put("category", category);
        reportPopupDTO popUp;
    	
        String returnValue = "";
        switch(category) {
        case "0" :
            popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "1" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "2" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        	
        case "3" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "4" :
        	MissingDTO missingDetail = new MissingDTO();
        	missingDetail=reportService.selectMissingDetail(boardCode);
        	List<PictureDTO> pictureMissingList = new ArrayList<>(); 
    		pictureMissingList = missingService.selectMissingDetailPicture(boardCode);
    		model.addAttribute("missingDetail",missingDetail);
    		model.addAttribute("pictureMissingList",pictureMissingList);
        	returnValue = "admin/main/popUpMissing";
        	break;
        case "5" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpMap";
        	break;
        case "6" :
        	AdoptDTO adoptDetail = new AdoptDTO();
    		adoptDetail=reportService.selectAdoptDetail(boardCode);
    		
    		
    		List<PictureDTO> pictureList = new ArrayList<>();
    		pictureList = adoptService.selectPictureList(boardCode);
    		model.addAttribute("adoptDetail",adoptDetail);
    		model.addAttribute("pictureList",pictureList);
        	returnValue = "admin/main/popUpAdopt";
        	break;
        }
        
    	return returnValue;
    }
}
