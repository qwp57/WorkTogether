package com.uni.wt.workState.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.workState.model.dto.WorkState;
import com.uni.wt.workState.service.WorkStateService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkStateController {
	
	@Autowired
	private WorkStateService wsService;
	
	@RequestMapping("workStateMain.do")
	public String workStateMain(HttpServletRequest request, Model m) throws Exception {
//		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
//		
//		if(emp != null) {
//			
//			log.info(emp.toString());
//		}
//		
//		Map<Spring, Object> paramMap = wsService.selectMyWork();
		
		
		
		
		
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
	@RequestMapping("/insertInTime.do")//출근시간 등록
	public int insertInTime(WorkState w) throws Exception {
		log.info("insertInTime.do 들어옴 ");
		
		
		log.info("emp_no : {}", w.getEmp_no());
		
		int result = wsService.insertInTime(w);
		
		
		return result;
	}
	@ResponseBody
	@RequestMapping("/updateOutTime.do")//퇴근시간 등록 
	public int updateOutTime(WorkState w) throws Exception {
		log.info("updateOutTime.do 들어옴 ");
		
		
		log.info("emp_no : {}", w.getEmp_no());
		
		int result = wsService.updateOutTime(w);
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/updateWorkStatus.do")//근무상태 변경
	public String updateWorkStatus(WorkState w) throws Exception {
		log.info("updateWorkStatus 들어옴 ");
		log.info(w.toString());
		
		String result = wsService.updateWorkStatus(w);

		return result;
	
		
	}

}
