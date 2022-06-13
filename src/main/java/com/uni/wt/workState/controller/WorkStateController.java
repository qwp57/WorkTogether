package com.uni.wt.workState.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.uni.wt.workState.model.dto.WorkState;
import com.uni.wt.workState.service.WorkStateService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkStateController {
	
	@Autowired
	private WorkStateService wsService;
	
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
	
	@ResponseBody
	@RequestMapping("/insertInTime.do")
	public int insertInTime(String emp_no) throws Exception {
		log.info("insertInTime.do 들어옴 ");
		
		
		log.info("emp_no : {}", emp_no);
		
		int result = wsService.insertInTime(emp_no);
		
		
		return result;
	}
	@ResponseBody
	@RequestMapping("/updateOutTime.do")
	public int updateOutTime(String emp_no) throws Exception {
		log.info("insertInTime.do 들어옴 ");
		
		
		log.info("emp_no : {}", emp_no);
		
		int result = wsService.updateOutTime(emp_no);
		
		
		return result;
	}

}
