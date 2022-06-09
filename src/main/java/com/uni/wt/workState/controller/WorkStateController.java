package com.uni.wt.workState.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkStateController {
	
	@RequestMapping("workStateMain.do")
	public String workStateMain() {
		
		return "workstate/myWorkState";
	}
	
	@RequestMapping("teamWorkState.do")
	public String teamWorkState() {
		
		return "workstate/teamWorkState";
	}
	
	@RequestMapping("vacationMgtMain.do")
	public String vacationMGTmain() {
		
		return "workstate/myVacation";
	}
	
	@RequestMapping("teamVacation.do")
	public String teamVacation() {
		
		return "workstate/teamVacation";
	}
	
	@RequestMapping("/workStatistics.do")
	public String workStatistics() {
		
		return "workstate/workStatistics";
	}
	@RequestMapping("/test")
	public String test() {
		
		return "workstate/NewFile";
	}

}
