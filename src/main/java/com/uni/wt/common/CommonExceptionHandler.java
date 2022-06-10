package com.uni.wt.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice("com.uni.wt")
public class CommonExceptionHandler {

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public String methodValidExc(MethodArgumentNotValidException e, Model m) {
		
		log.debug(e.getMessage());
		
		
		return "common/errorPage";
		
		
	}
	
}
