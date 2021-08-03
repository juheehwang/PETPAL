package com.nobanryeo.petpal.user.adopt.api;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
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
	public Response selectBoard(@ApiParam(value="지역 검색 키워드", required=false)@PathVariable String search) {
		
		Response response = new Response();
		
		List<AdoptPictureManageDTO> adoptSearchList = adoptService.selectSearchList(search);
		
		response.add("adoptSearchList", adoptSearchList);
		
		return response;
	}
	
	@ApiOperation("adopt 상세 게시판 조회")
	@GetMapping("adopt/{boardCode}")
	public Response boardDetail(@ApiParam(value="상세조회할 게시글 번호", required = true,type="integer")@PathVariable int boardCode) {
		
		Response response = new Response();
		AdoptDTO adoptDetail = new AdoptDTO();
		adoptDetail=adoptService.selectAdoptDetail(boardCode);
		
		
		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = adoptService.selectPictureList(boardCode);

		Map<String,Object> boardDetail = new HashMap<>();
		boardDetail.put("adoptDetail", adoptDetail);
		boardDetail.put("pictureList", pictureList);
		
		response.add("boardDetail", boardDetail);
		
		return response;
	}
	
	@ApiOperation("adopt 게시글 저장 전 파일 처리")
	@PostMapping(value="adopt/changeImg", produces = "application/json")
	@ResponseBody
	public String convertImageFile(@RequestParam("file") List<MultipartFile> multipartFile,HttpServletRequest request) {
		//Json으로 리턴하기위해 리스트 객체 생성
		JsonArray jsonArr = new JsonArray();
		
		//리스트로 들어온 파일 처리
		for(int i=0; i<multipartFile.size();i++) {
			JsonObject jsonObject = new JsonObject();
			
			String fileRoot = request.getSession().getServletContext().getRealPath("resources")+ "\\uploadFiles";
			
			File mkdir = new File(fileRoot);
			if(!mkdir.exists()) {
				mkdir.mkdirs();
			}
			
			String originalFileName = multipartFile.get(i).getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID().toString().replace("-", "")+extension;	//저장될 파일 명
			String utilPath = "resources\\uploadFiles\\"+savedFileName; // JSP에서 사용할 파일명
			
			File targetFile = new File(fileRoot +"\\"+ savedFileName);	
			try {
				InputStream fileStream = multipartFile.get(i).getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	// 파일 서버에 저장
				jsonObject.addProperty("url", "/petpal/resources/uploadFiles/"+savedFileName);
				jsonObject.addProperty("responseCode", "success");
				jsonObject.addProperty("originFileName", originalFileName);
				jsonObject.addProperty("saveName", savedFileName);
				jsonObject.addProperty("filePath", fileRoot);
				jsonObject.addProperty("utilPath", utilPath);
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			jsonArr.add(jsonObject);
		}
		return jsonArr.toString();
	}
	
	@ApiOperation("adopt 게시글 쓰기")
	@PostMapping(value="adopt", produces = "application/json; charset=utf8")
	public Response insertAdoptInfo(@RequestBody Map<String, Object> formDataMap) {
		
		Response response = new Response();
		
		Map<String,String> adopt = (LinkedHashMap<String,String>)formDataMap.get("formData");
		List<LinkedHashMap<String,String>> imageData = (List<LinkedHashMap<String, String>>) formDataMap.get("imageData");
		
		AdoptDTO adoptDTO = new AdoptDTO();
		adoptDTO.setAdoptAge(Integer.parseInt(adopt.get("adoptAge")));
		adoptDTO.setAddress(adopt.get("address"));
		adoptDTO.setAdoptBreed(adopt.get("adoptBreed"));
		adoptDTO.setAdoptCaution(adopt.get("adoptCaution"));
		adoptDTO.setAdoptColor(adopt.get("adoptColor"));
		adoptDTO.setAdoptGender(adopt.get("adoptGender"));
		adoptDTO.setAdoptIntroduce(adopt.get("adoptIntroduce"));
		adoptDTO.setAdoptPhone(adopt.get("adoptPhone"));
		adoptDTO.setAdoptWeight(Double.parseDouble(adopt.get("adoptWeight")));
		adoptDTO.setDogOrcat(adopt.get("dogOrcat"));
		adoptDTO.setUserCode(Integer.parseInt(adopt.get("userCode")));
		
		List<PictureDTO> pictureList = new ArrayList<>();
		
		for(int i =0; i<imageData.size();i++) {
			
			Map<String,String> file= imageData.get(i);

			PictureDTO pictureDTO = new PictureDTO();
			pictureDTO.setPictureName(file.get("originFileName"));
			pictureDTO.setPictureDeleteYN("N");
			pictureDTO.setPictureURL(file.get("filePath"));
			pictureDTO.setPictureNewName(file.get("saveName"));
			pictureDTO.setPictureUtilPath(file.get("url"));
			
			pictureList.add(pictureDTO);
		}
		
		int result = adoptService.registAdopt(adoptDTO, pictureList);

		Map<String,Object> finalResultMap = new HashMap<String, Object>();
		finalResultMap.put("adoptDTO", adoptDTO);
		finalResultMap.put("pictureList",pictureList);
		
		if(result>0) {
			response.add("result",finalResultMap);
		}else {
			response.add("result", "error");
		}
		return response;
	}
	
	@ApiOperation("adopt 게시글 수정")
	@PutMapping("adopt/{boardCode}")
	public Response revisedBoard(@ApiParam(value="수정할 게시글 번호", required = true,type="integer")@PathVariable int boardCode, @RequestBody Map<String, Object> formDataMap) {
		
		Response response = new Response();

		Map<String,String> adopt = (LinkedHashMap<String,String>)formDataMap.get("formData");
		List<LinkedHashMap<String,String>> imageData = (List<LinkedHashMap<String, String>>) formDataMap.get("imageData");
		
		PictureDTO pictureDTO = new PictureDTO();
		AdoptDTO adoptDTO = new AdoptDTO();
		
		// 해당하는 게시글의 번호를 DTO에 담아서 보내기위해 set으로 값을 넣어준다.
		pictureDTO.setBoardCode(boardCode);
		adoptDTO.setBoardCode(boardCode);
		
		int updateResult = 0;
		
		// 게시글 수정전 사진 삭제 (N-> Y)
		int deletePictureResult = adoptService.deletePicture(pictureDTO);
		List<PictureDTO> pictureList = new ArrayList<>();
		
		if(deletePictureResult>0) {
			
		// 게시글 수정 시작 (사진포함)
			adoptDTO.setAdoptAge(Integer.parseInt(adopt.get("adoptAge")));
			adoptDTO.setAddress(adopt.get("address"));
			adoptDTO.setAdoptBreed(adopt.get("adoptBreed"));
			adoptDTO.setAdoptCaution(adopt.get("adoptCaution"));
			adoptDTO.setAdoptColor(adopt.get("adoptColor"));
			adoptDTO.setAdoptGender(adopt.get("adoptGender"));
			adoptDTO.setAdoptIntroduce(adopt.get("adoptIntroduce"));
			adoptDTO.setAdoptPhone(adopt.get("adoptPhone"));
			adoptDTO.setAdoptWeight(Double.parseDouble(adopt.get("adoptWeight")));
			adoptDTO.setDogOrcat(adopt.get("dogOrcat"));
			adoptDTO.setUserCode(Integer.parseInt(adopt.get("userCode")));
			
			for(int i =0; i<imageData.size();i++) {
				
				Map<String,String> file= imageData.get(i);

				pictureDTO.setPictureName(file.get("originFileName"));
				pictureDTO.setPictureDeleteYN("N");
				pictureDTO.setPictureURL(file.get("filePath"));
				pictureDTO.setPictureNewName(file.get("saveName"));
				pictureDTO.setPictureUtilPath(file.get("url"));
				
				pictureList.add(pictureDTO);
			}
		
			 updateResult = adoptService.updatetAdopt(adoptDTO, pictureList);
		}
		
		Map<String,Object> finalResultMap = new HashMap<String, Object>();
		finalResultMap.put("adoptDTO", adoptDTO);
		finalResultMap.put("pictureList",pictureList);
		
		if(updateResult>0) {
		response.add("result",finalResultMap);
		}else {
			response.add("result", "error");
		}
		
		return response;
	}
	
	@ApiOperation("adopt 게시글 삭제")
	@DeleteMapping("adopt/{baordCode}")
	public Response deleteBoard(@ApiParam(value="삭제할 게시글 번호", required = true,type="integer")@PathVariable int boardCode) {
		
		Response response = new Response();
		
		int result = adoptService.deleteBoard(boardCode);
		if(result>0) {
			response.add("result", "success");
		}else {
			response.add("result", "error");
		}
		return response;
	}
	
}
