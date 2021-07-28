package com.nobanryeo.petpal.user.adopt.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@RestController
@Api("Adopt Controller API V1")
@RequestMapping("/api/*")
public class AdoptApiController {

	@Autowired
	private final AdoptService adoptService;
	
	public AdoptApiController(AdoptService adoptService) {
		this.adoptService = adoptService;
	} 
	
	@ApiOperation("adopt 전체 리스트 조회")
	@GetMapping("adopt")
	public Response boardList() {
		
			Response response  = new Response();
			response.add("boardTotalList", adoptService.selectAdoptList());
			return response;
		}

	@ApiOperation("adopt 전체 리스트 중 지역 검색 결과 리스트 조회")
	@GetMapping("adopt/search/{search}")
	public Response selectBoard(@ApiParam(value="지역 검색 키워드")@PathVariable("search") String keyword) {
		
		Response response = new Response();
		
		List<AdoptPictureManageDTO> adoptSearchList = adoptService.selectSearchList(keyword);
		
		response.add("adoptSearchList", adoptSearchList);
		
		return response;
	}
	
	@ApiOperation("adopt 상세 게시판 조회")
	@GetMapping("adopt/{boardCode}")
	public Response boardDetail(@ApiParam(value="상세조회할 게시글 번호")@PathVariable("boardCode") int code) {
		
		Response response = new Response();
		AdoptDTO adoptDetail = new AdoptDTO();
		adoptDetail=adoptService.selectAdoptDetail(code);
		
		
		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = adoptService.selectPictureList(code);
		
		System.out.println(adoptDetail);
		
		response.add("adoptDetail", adoptDetail);
		response.add("pictureList", pictureList);
		
		return response;
	}
	
}
