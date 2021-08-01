package com.nobanryeo.petpal.user.adopt.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.apache.commons.fileupload.FileItem;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author judyh
 *
 */

@Controller
@RequestMapping("/user/*")
public class AdoptController {

	private final AdoptService adoptService; 
	
	
	@Autowired
	public AdoptController(AdoptService adoptService) {
		this.adoptService = adoptService;
	}
	
	@GetMapping("adopt")
	public String introAdopt() {

		return "user/adopt/adoptPage";
	}
	
	/**
	 * 상세페이지 호출 메소드
	 * @param model
	 * @param code
	 * @return jsp 페이지
	 */
	@GetMapping("adopt/detail/{boardCode}")
	public String getBoardDetail(Model model, @PathVariable("boardCode") int code){
		
		model.addAttribute("boardCode", code);
		
		return "user/adopt/adoptDetail";
		
	}
	/**
	 * @return terms page 호출
	 */
	@GetMapping("adopt/terms")
	public String termsAdopt() {
		return "user/adopt/terms";
	}
	
	/**
	 * @return write page 호출
	 */
	@GetMapping("adopt/write")
	public String writeAdoptInfo() {
		return "user/adopt/adoptBoardWrite";
	}
	

	
	@PostMapping("adopt/insert/report")
	public String insertReport(Model model, HttpServletRequest request, HttpSession session, FreeBoardReportDTO boardreportDTO, AdoptReplyDTO adoptreplyDTO) {
		
		String reportContent = request.getParameter("reportContent");
		String reportReply = request.getParameter("reportReply");
		int contentCode = Integer.parseInt(request.getParameter("contentCode"));
	
		String boardTitle = request.getParameter("boardTitle");
		String category = request.getParameter("category");
		
		int boardreportResult = 0;
		int replyreportResult =0;
		
		int userCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
		if(!reportContent.isEmpty()) {	
			boardreportDTO.setUserCode(userCode);
			boardreportDTO.setReportContent(reportContent);
			boardreportDTO.setReportTitle(boardTitle);
			boardreportDTO.setBoardCode(contentCode);
			
			boardreportResult = adoptService.insertBoardReport(boardreportDTO);
		}
		
		if(!reportReply.isEmpty()) {
			int replycode = Integer.parseInt(request.getParameter("replycode"));
			int replyUsercode = Integer.parseInt(request.getParameter("replyUsercode"));
			
			adoptreplyDTO.setBoardCode(contentCode);
			adoptreplyDTO.setReplyCode(replycode);
			adoptreplyDTO.setReplyReportContent(reportReply);
			adoptreplyDTO.setReplyUserCode(userCode);
			adoptreplyDTO.setBoardUserCode(replyUsercode);
			
			replyreportResult = adoptService.insertReplyReport(adoptreplyDTO);
		}
		if(boardreportResult >0 || replyreportResult>0) {
			model.addAttribute("message", "success");
		}else {
			model.addAttribute("message", "fail");
		}
		
		return "redirect:/user/adopt/detail/"+contentCode;
	}
	
	@PostMapping("insert/adopt/message")
	public String insertMessage(Model model, HttpServletRequest request, HttpSession session, MessageTableDTO messageDTO) {
		
		String boardCode = request.getParameter("boardcode");
		int senderCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
		int receiverCode = Integer.parseInt(request.getParameter("receivecode"));
		String senderNickname = ((UserInfoDTO)session.getAttribute("loginUser")).getNikname();
		String receiverNickname = request.getParameter("receiveUserNick");
		String messageContent = request.getParameter("messageContent");
		
		messageDTO.setMessageContent(messageContent);
		messageDTO.setReceiveUserNick(receiverNickname);
		messageDTO.setSendUserNick(senderNickname);
		messageDTO.setUserCode(senderCode);
		messageDTO.setUserCode1(receiverCode);
		
		int messageResult = adoptService.insertMessage(messageDTO);
		
		return "redirect:/user/adopt/detail/"+boardCode;
		
	}
	
	@GetMapping("adopt/update")
	public String putBoardRevisedInfo() {
		return "user/adopt/adoptBoardRevised";
	}
	
	@GetMapping("adopt/update/status")
	public String putAdoptStatus(@RequestParam("board") int board, HttpServletRequest request) {
		System.out.println("board: "+board);
		
		int baordCode = Integer.parseInt(request.getParameter("board"));

		
		int result = adoptService.putAdoptStatus(baordCode);
		
		System.out.println("controller in update status: " + result);
		
		return "redirect:/user/adopt/detail/"+baordCode;
	}
	@GetMapping("adopt/update/{boardCode}")
	public String updateBoard(@PathVariable("boardCode") int code, Model model ) {
		
		AdoptDTO adoptDetail = new AdoptDTO();
		adoptDetail=adoptService.selectAdoptDetail(code);
		
		
		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = adoptService.selectPictureList(code);
		
		System.out.println(adoptDetail);
		
		for(PictureDTO picture:pictureList) {
			System.out.println(picture);
		}
		
		model.addAttribute("boardCode", code);
		model.addAttribute("adoptDetail", adoptDetail);
		model.addAttribute("pictureList", pictureList);
		return "user/adopt/adoptBoardRevised";
	}
	
}