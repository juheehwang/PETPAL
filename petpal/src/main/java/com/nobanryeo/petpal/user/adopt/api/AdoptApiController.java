package com.nobanryeo.petpal.user.adopt.api;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api("Adopt Controller API V1")
@RequestMapping("/user/*")
public class AdoptApiController {


	private final AdoptService adoptService;
	
	@Autowired
	public AdoptApiController(AdoptService adoptService) {
		this.adoptService = adoptService;
	} 
	
	@GetMapping("adopt")
	public String introAdopt() {

		return "user/adopt/adoptPage";
	}
	
	
	@ApiOperation("adopt 전체 리스트 조회")
	@GetMapping("adoptData")
	public ModelAndView selectAdoptMain(ModelAndView mv, HttpServletResponse response) {
			
			response.setContentType("application/json; charset=utf-8");
			List<AdoptPictureManageDTO> adoptList = new ArrayList<>();
			adoptList=adoptService.selectAdoptList();
			
	//		System.out.println("adoptList in controller: "+adoptService.selectAdoptList());
			System.out.println("controller: "+adoptList);
			
			Gson gson = new GsonBuilder().setPrettyPrinting()
					.setFieldNamingPolicy(FieldNamingPolicy.IDENTITY)
					.serializeNulls().disableHtmlEscaping().create();
		
			mv.addObject("adoptList", gson.toJson(adoptList));
			mv.setViewName("jsonView");
			
			return mv;
		}
	
	
}
