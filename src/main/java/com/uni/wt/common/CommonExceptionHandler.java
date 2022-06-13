package com.uni.wt.common;

import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice("com.uni.wt")
public class CommonExceptionHandler {

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model m) {
		String errorMsg = e.getMessage();
		log.error("Exception 발생");
		log.error(e.getClass().getName());
		e.printStackTrace();
		log.error(errorMsg);
		m.addAttribute("errorMsg", errorMsg);
		
		return "common/errorPage";
		
		
	}
	
	@ExceptionHandler(BindException.class)
	public String bindException(BindException e, Model m) {
	
		log.error("BindException 발생");
		e.printStackTrace();
		log.error("Error : {}",e.getMessage());
		log.error(e.getBindingResult().getAllErrors().get(0).getDefaultMessage());
		
		String errorMsg = e.getBindingResult().getAllErrors().get(0).getDefaultMessage();
		
		m.addAttribute("errorMsg", errorMsg);
		return"employee/register";
		
		
	}
	
/*	@ExceptionHandler(NoHandlerFoundException.class)
	public String handler404(NoHandlerFoundException e, Model m) {
		
		log.error("404 발생!");
		log.error(e.getStackTrace().toString());
		log.error(e.getMessage());
		
		m.addAttribute("errorMsg",e.getMessage());
		return "common/errorPage-400";
		
	}*/
	
	
}
