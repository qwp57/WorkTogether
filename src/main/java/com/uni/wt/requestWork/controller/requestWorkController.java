package com.uni.wt.requestWork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class requestWorkController {
	
	@RequestMapping("requestWorkMain.do")
	public String requestWorkMain() {
		
		return "requestwork/rwMain";
	}
	
	@RequestMapping("completedRequest.do")
	public String completedRequest() {
		
		return "requestwork/rwCompleted";
	}
	
	@RequestMapping("allRequest.do")
	public String allRequest() {
		
		return "requestwork/rwAllList";
	}

}
