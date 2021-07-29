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
	

	/**
	 * 입양글과 사진 insert method
	 * @param adopt
	 * @param mv
	 * @param request
	 * @param picture
	 * @param rttr
	 * @param session
	 * @return insert result
	 */
	@PostMapping("adopt/write")
	public String putAdoptInfo(@ModelAttribute AdoptDTO adopt,Model model, HttpServletRequest request,@RequestParam(name="picture",required=true) List<MultipartFile> picture, RedirectAttributes rttr, HttpSession session) {
		
		
		//세선값 넣기
		
		int userCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
		adopt.setUserCode(userCode);
		System.out.println("controller adopt: "+adopt);
		System.out.println("controller picture: "+picture);
		
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root in controller: "+ root);
		
		String filePath = root + "\\uploadFiles";
		
		File mkdir = new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdirs();
		}
		
		List<Map<String,String>> files = new ArrayList<>();
		

		for(int i=0; i<picture.size();i++) {
			
			/* 파일명 변경 처리*/
			String originFileName = picture.get(i).getOriginalFilename();
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String saveName = UUID.randomUUID().toString().replace("-", "")+ext;
			
			Map<String,String> file = new HashMap<String, String>();
			file.put("originFileName", originFileName);
			file.put("saveName", saveName);
			file.put("filePath", filePath);
			file.put("utilPath", "resources\\uploadFiles\\"+saveName);
			
			files.add(file);
			
		}
		System.out.println(files);
		/* 파일을 저장한다,*/
		List<PictureDTO> pictureList = new ArrayList<>();
		try {
			for(int i =0; i<picture.size();i++) {
				
				Map<String,String> file= files.get(i);

				picture.get(i).transferTo(new File(filePath +"\\"+file.get("saveName")));
				System.out.println("for문안의 file: "+ file);

				
				PictureDTO pictureDTO = new PictureDTO();
				pictureDTO.setPictureName(file.get("originFileName"));
				pictureDTO.setPictureDeleteYN("N");
				pictureDTO.setPictureURL(file.get("filePath"));
				pictureDTO.setPictureNewName(file.get("saveName"));
				pictureDTO.setPictureUtilPath(file.get("utilPath"));
				
				pictureList.add(pictureDTO);
			}
			model.addAttribute("message", "파일업로드 성공!!!");
		}catch(Exception e) {
			e.printStackTrace();
			
			/* 실패시 파일 삭제 */
			for(int i =0; i<picture.size();i++) {
				System.out.println("실패인가?");
				Map<String,String> file= files.get(i);
				new File(filePath +"\\"+ file.get("saveName")).delete();

		}
		
			model.addAttribute("message", "파일업로드 실패!!");
		
		}
		
		int result = adoptService.registAdopt(adopt, pictureList);
		
		System.out.println("controller result : "+ result);
		int boardCode = adoptService.selectBoardCode();
		if(result>0) {
			rttr.addFlashAttribute("message", "입양글 등록에 성공하셨습니다.");
			
		}else {
			rttr.addFlashAttribute("message", "입양글 등록에 실패하셨습니다.");
		}
		
		return "redirect:/user/adopt/detail/"+boardCode;
		
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
		
		model.addAttribute("adoptDetail", adoptDetail);
		model.addAttribute("pictureList", pictureList);
		return "user/adopt/adoptBoardRevised";
	}
	
	@PostMapping("adopt/update/{boardCode}")
	public String updateBoard(@ModelAttribute AdoptDTO adopt,@PathVariable("boardCode") int code, Model model,HttpServletRequest request,@RequestParam(name="picture",required=true) List<MultipartFile> picture, HttpSession session) throws ParseException {
		int updateResult = 0;
		System.out.println(" updateBoard여기오나???!?!?");
		
		PictureDTO pictureDTO = new PictureDTO();
		pictureDTO.setBoardCode(code);
		adopt.setBoardCode(code);
		
		
		// 게시글 수정전 사진 삭제 (N-> Y)
		int deletePictureResult = adoptService.deletePicture(pictureDTO);
		System.out.println("사진 삭제 성공??? "+ deletePictureResult);
		if(deletePictureResult>0) {
			
		// 게시글 수정 시작 (사진포함)
			System.out.println("controller adopt: "+adopt);
			System.out.println("controller picture: "+picture);
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("root in controller: "+ root);
			
			String filePath = root + "\\uploadFiles";
			
			File mkdir = new File(filePath);
			if(!mkdir.exists()) {
				mkdir.mkdirs();
			}
			
			List<Map<String,String>> files = new ArrayList<>();
			

			for(int i=0; i<picture.size();i++) {
				
				/* 파일명 변경 처리*/
				String originFileName = picture.get(i).getOriginalFilename();
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String saveName = UUID.randomUUID().toString().replace("-", "")+ext;
				
				Map<String,String> file = new HashMap<String, String>();
				file.put("originFileName", originFileName);
				file.put("saveName", saveName);
				file.put("filePath", filePath);
				file.put("utilPath", "resources\\uploadFiles\\"+saveName);
				
				files.add(file);
				
			}
			System.out.println(files);
			/* 파일을 저장한다,*/
			List<PictureDTO> pictureList = new ArrayList<>();
			try {
				for(int i =0; i<picture.size();i++) {
					
					Map<String,String> file= files.get(i);

					picture.get(i).transferTo(new File(filePath +"\\"+file.get("saveName")));
					System.out.println("for문안의 file: "+ file);

					
					pictureDTO.setPictureName(file.get("originFileName"));
					pictureDTO.setPictureDeleteYN("N");
					pictureDTO.setPictureURL(file.get("filePath"));
					pictureDTO.setPictureNewName(file.get("saveName"));
					pictureDTO.setPictureUtilPath(file.get("utilPath"));
					
					pictureList.add(pictureDTO);
				}
				model.addAttribute("message", "파일업로드 성공!!!");
			}catch(Exception e) {
				e.printStackTrace();
				
				/* 실패시 파일 삭제 */
				for(int i =0; i<picture.size();i++) {
					System.out.println("실패인가?");
					Map<String,String> file= files.get(i);
					new File(filePath +"\\"+ file.get("saveName")).delete();

			}
			
				model.addAttribute("message", "파일업로드 실패!!");
			
			}
		
			updateResult = adoptService.updatetAdopt(adopt, pictureList);
		}
			System.out.println("controller result : "+ updateResult);
			
			return "redirect:/user/adopt/detail/"+code;
	}
	
}