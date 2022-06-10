package com.uni.wt.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice("com.uni.wt")
public class ExceptionHandler {

	@ExceptionHandler
	public String methodValidExc() {
		
		
	}
}
