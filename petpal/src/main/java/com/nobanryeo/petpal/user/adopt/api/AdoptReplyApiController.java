package com.nobanryeo.petpal.user.adopt.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api("Adopt Reply Controller API V1")
@RequestMapping("/api/*")
public class AdoptReplyApiController {
	
	@Autowired
	private final AdoptService adoptService;
	
	public AdoptReplyApiController(AdoptService adoptService) {
		this.adoptService = adoptService;
	} 
	
	@ApiOperation("adoptReply 전체 리스트 조회")
	@GetMapping("reply/{boardCode}")
	public Response selectreplyList(@PathVariable("boardCode") int code) {
		
		//새로운 response 객체 생성
		Response response = new Response();
		
		List<AdoptReplyDTO> replyList = adoptService.selectReplyList(code);
		
		//불러온 댓글리스트를 요청보내기위해 담기
		response.add("replyList", replyList);
		
		return response;
	}
	
	@ApiOperation("reply 추가 ")
	@PostMapping("reply")
	public Response insertReply(@ModelAttribute AdoptReplyDTO replyDTO, String replyContent, String boardCode, HttpSession session, HttpServletRequest request) {

		Response response = new Response();

		int userCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
		boardCode = request.getParameter("boardCode");
		replyDTO.setBoardCode((int)(Integer.parseInt(boardCode)));
		replyDTO.setReplyContent(request.getParameter("replyContent"));
		replyDTO.setReplyUserCode(userCode);
		
		int result = adoptService.insertReply(replyDTO);
		
		if(result>0) {
			response.add("message", "success");
		
		}else {
			response.add("message", "fail");
		}
		return response;
	}

}
