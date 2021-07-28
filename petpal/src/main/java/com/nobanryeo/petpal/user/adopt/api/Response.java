package com.nobanryeo.petpal.user.adopt.api;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.annotations.ApiModelProperty;

public class Response {

	@ApiModelProperty(example ="상태코드")
	private int status;
	
	@ApiModelProperty(example ="메세지")
	private String message;
	
	@ApiModelProperty(example ="시간")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private LocalDateTime localDate;
	
	@ApiModelProperty(example ="요청 데이터")
	private Map<String,Object> data;

	public Response() {
		this(HttpStatus.OK);
	}
	
	public Response(HttpStatus httpStatus) {
		this.status = httpStatus.value();
		this.message = httpStatus.getReasonPhrase();
		this.localDate = LocalDateTime.now();
		this.data = new HashMap<>();
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDateTime getLocalDate() {
		return localDate;
	}

	public void setLocalDate(LocalDateTime localDate) {
		this.localDate = localDate;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Response [status=" + status + ", message=" + message + ", localDate=" + localDate + ", data=" + data
				+ "]";
	}
	
	public void add(String key,Object value) {
		
		this.data.put(key, value);
	}
	
	
	
}
