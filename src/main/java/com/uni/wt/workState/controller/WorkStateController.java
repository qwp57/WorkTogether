package com.uni.wt.workState.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.uni.wt.common.LunarCalendar;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.workState.model.dto.WorkState;
import com.uni.wt.workState.service.WorkStateService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkStateController {
	
	@Autowired
	private WorkStateService wsService;
	
	@Autowired
	private LunarCalendar lunarCal;
	
	@ResponseBody
	@RequestMapping(value="workState.do")
	public ModelAndView workState(HttpServletRequest request, ModelAndView mv) throws Exception {
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		
		
		mv.setViewName("workstate/myWorkState");
		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="workStateSelectWeek.do")
	public String workStateSelectWeek(HttpServletRequest request, ModelAndView mv, String startday) throws Exception {
		log.info("startday : {}", startday);
		Map<String, Object> data = new HashMap<String, Object>();
			
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		log.info("선택 주 일요일 : {}", startday);
		ArrayList<String> weekHoliday = (ArrayList<String>) lunarCal.WeekHoliday(startday);
		log.info("[선택 주 휴일] : {} ", weekHoliday.toString());
		Map<Spring, Object> resultMap = wsService.selectMyWork(startday, emp.getEmp_no(), weekHoliday);
		ArrayList<Integer> workTime = wsService.selectWorkTimeList(startday, emp.getEmp_no());

		if(workTime != null) {
			log.info("일주일 근로시간 리스트 : {}" , workTime.toString());
		}
		
		data.put("weekHoliday", weekHoliday);
		data.put("workTime", workTime);
		data.put("resultMap", resultMap);
		
		return new Gson().toJson(data);
		
	}
	
	@RequestMapping("teamWorkState.do")
	public String teamWorkState(HttpServletRequest request, Model m) {
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		//ArrayList<Employee> empList = wsService.selectTeamWorkList(emp);
		
	//	m.addAttribute("empList", empList);
		
		
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
