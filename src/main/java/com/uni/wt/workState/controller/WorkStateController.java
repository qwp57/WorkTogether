package com.uni.wt.workState.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.Gson;
import com.uni.wt.common.LunarCalendar;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.commonFile.FileService;
import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.employee.model.service.EmployeeService;
import com.uni.wt.workState.model.dto.Vacation;
import com.uni.wt.workState.model.dto.WorkState;
import com.uni.wt.workState.service.WorkStateService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WorkStateController {
	
	@Autowired
	private WorkStateService wsService;
	
	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private LunarCalendar lunarCal;
	
	@ResponseBody
	@RequestMapping(value="/workStateMain.do")
	public ModelAndView workState(HttpServletRequest request, ModelAndView mv) throws Exception {
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		
		
		mv.setViewName("workstate/myWorkState");
		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/workStateSelectWeek.do")
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
	
	@RequestMapping("/teamWorkState.do")
	public String teamWorkState(HttpServletRequest request, Model m, @RequestParam(value="startday", required = false) String startday,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) throws Exception {
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		
		if(startday == null) {
			LocalDate today = LocalDate.now();
			int dayOfWeek = today.getDayOfWeek().getValue();
			log.info("dayOfWeek : {}", dayOfWeek);
			today = today.minusDays(dayOfWeek);
			log.info(today.toString());
			
			startday = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		log.info("[startday] : {}",startday);
		log.info("[currentPage] : {}",currentPage);
		ArrayList<String> weekHoliday = (ArrayList<String>) lunarCal.WeekHoliday(startday);
		log.info("[선택 주 휴일] : {} ", weekHoliday.toString());
		
		//사원별 통계 가져오는데 필요한 정보 : 시작날짜, 휴가일리스트, 조회 당사자 정보(부서번호, 직위번호), 페이징
		//1. 페이징
		int listCount = wsService.selectTeamEmpCount(emp);
		log.info("[전체 팀원] : {}명", listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Object> empList = wsService.selectTeamWorkList(emp, weekHoliday, startday, pi);
		
		if(empList == null) {
			
			m.addAttribute("msg", "관리중인 팀원이 없습니다.");
			return "workstate/teamWorkState";
			
		}
		
		for(int i = 0; i<empList.size(); i++) {
			log.info(i+"번째 empList : "+ empList.get(i).toString());
			
		}
		
		log.info("[팀원 통합 근무시간] : {}",empList.toString());
		
		ArrayList<Object> weekList = wsService.selectTeamWeekList(emp, startday, pi);
		
		log.info("[팀원 일주일 근무 리스트] : {}",weekList.toString());
			
		m.addAttribute("empList", empList);
		m.addAttribute("weekList", weekList);
		m.addAttribute("pi", pi);
		m.addAttribute("startday", startday);
		
		return "workstate/teamWorkState";
	}
	
	@RequestMapping("/vacationMgtMain.do")//휴가 메인
	public String vacationMGTmain(HttpServletRequest request,Model m, @RequestParam(value = "year", required = false) String year) throws Exception {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap != null) {
			Map<String, String> params = (Map<String, String>) flashMap.get("msg");
			
			String msg = params.get("msg");
			
			m.addAttribute("msg", msg);
		}
		
		if(year == null) {
			LocalDate today = LocalDate.now();
			year = String.valueOf(today.getYear());
		}
		
		log.info("휴가 선택 연도 : {}",year);
		
		//부서 결재자 목록
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[현재 로그인한 유저]  : {}", emp.toString());
		// 부서 결재자 가져오기 
		ArrayList<Employee> SupvEmp = empService.selectSupvEmpList(emp);
		//휴가 남은 일수들 가져오기
		ArrayList<Integer> days = wsService.selectVacDays(emp);
		//카테고리에 쓸 년도 가져오기
		ArrayList<String> years = wsService.selectYears(emp);
		if(years == null) {
			years.add(String.valueOf(LocalDate.now().getYear()));
		}
		
		//휴가 예정 내역 가져오기 
		ArrayList<Vacation> newVacList = wsService.selectVacList(emp, "new", year);
		//휴가 사용 내역 가져오기 
		ArrayList<Vacation> oldVacList = wsService.selectVacList(emp, "old", year);
		log.info("[휴가 예정 내역] : {}", newVacList.toString());
		log.info("[휴가 사용 내역] : {}", oldVacList.toString());
		
		
		
		
		m.addAttribute("SupvEmp", SupvEmp);
		m.addAttribute("days", days);
		m.addAttribute("years", years);
		m.addAttribute("newVacList", newVacList);
		m.addAttribute("oldVacList", oldVacList);
		m.addAttribute("selectedYear",year);
		
		return "workstate/myVacation";
	}
	
	@RequestMapping("/insertVacation.do")
	public String insertVacation(Vacation vac, @RequestParam(name="uploadFile", required=false) MultipartFile file,
			HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		Map<String, String> msgMap = new HashMap<String, String>(); 
		log.info(vac.toString());
		int fileSeq = 0;

		if(!file.getOriginalFilename().equals("")) {//만약 받아온 파일이 비어 있어있지 않으면
			fileSeq = fileService.uploadFile(file, request, "VA");
			
			vac.setFile_no(fileSeq);
			
		}
		
		int result = wsService.insertVacation(vac);
		log.info("휴가 신청서 등록 결과 : {}", result);
		
		
		if(result >0) {
			
			msgMap.put("msg", "휴가신청서가 성공적으로 제출됐습니다.");
		}else {
			fileService.failed(fileSeq);
			msgMap.put("msg", "휴가신청서 제출에 실패했습니다.");
			
		}
		redirect.addFlashAttribute("msg", msgMap);
		
		
		
		return "redirect:/vacationMgtMain.do";
	}
	


	@RequestMapping("/teamVacation.do")
	public String teamVacation(HttpServletRequest request,Model m, @RequestParam(value = "year", required = false) String year,
			@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
			SearchDto sd) throws Exception {
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[로그인한 유저 ] : {}", emp.toString());
		
		if(year == null) {
			LocalDate today = LocalDate.now();
			year = String.valueOf(today.getYear());
		}
		
		if(sd != null) {
			log.info("검색 타겟 : "+sd.getSearchTarget()+"\n검색어 : "+sd.getSearchKeyword());
			
			m.addAttribute("sd", sd);
		}
		
		log.info("[해당 연도] : {}", year);
		int listCount = wsService.getTeamVacCount(year,emp, sd);//올해 팀원들의 휴가 내역
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<String> years = wsService.getYearsCnt(emp);
		
		ArrayList<Vacation> teamVacList = wsService.selectTeamVacList(emp, year, pi, sd);
		m.addAttribute("years", years);
		m.addAttribute("year", year);
		m.addAttribute("teamVacList",teamVacList);
		m.addAttribute("pi", pi);
		
		///////검색키워드가 있을경우//////////////////
	
		return "workstate/teamVacation";
	}
	
	@RequestMapping("/workStatistics.do")
	public String workStatistics(Model m) throws Exception {
		
		LocalDate ld = LocalDate.now();
		
		int month = ld.getMonthValue();
		int year = ld.getYear();
		
//		ArrayList<Employee> empOfTheMonthList = bestEmployee(month, "month");
		ArrayList<Employee> empOfTheYearList = bestEmployee(year, "year");
//		
//		ArrayList<Map<String, Object>> statsOfTheMonthList= departmentStats(month, "month");
		ArrayList<Map<String, Object>> statsOfTheYearList = departmentStats(year, "year");
		ArrayList<Employee> empOfTheMonthList = bestEmployee(6, "month");
		
		ArrayList<Map<String, Object>> statsOfTheMonthList= departmentStats(6, "month");
		
		log.info("[empOfTheMonthList] : {}",empOfTheMonthList.toString());
		log.info("[empOfTheYearList] : {}",empOfTheYearList.toString());
		log.info("[statsOfTheMonthList] : {}",statsOfTheMonthList.toString());
		log.info("[statsOfTheYearList] : {}",statsOfTheYearList.toString());
		
		m.addAttribute("empOfTheMonthList", empOfTheMonthList);
		m.addAttribute("empOfTheYearList", empOfTheYearList);
		m.addAttribute("statsOfTheMonthList", statsOfTheMonthList);
		m.addAttribute("statsOfTheYearList", statsOfTheYearList);
		
		
		
		
		return "workstate/workStatistics";
	}

	private ArrayList<Map<String, Object>> departmentStats(int monthYear, String type) throws Exception {
		// TODO Auto-generated method stub
		return wsService.departmentStats(monthYear, type);
	}

	public ArrayList<Employee> bestEmployee(int monthYear, String type) throws Exception{
		
		return wsService.bestEmployee(monthYear, type);
	}
	
	@ResponseBody
	@RequestMapping("workstateStats_month.do")
	public String wsStats_month(int month, String type) throws Exception {
		ArrayList<Map<String, Object>> list1 = departmentStats(month, type);
		ArrayList<Employee> list2 = bestEmployee(month, type);
		log.info("월별 통계");
		log.info("list1 : {}", list1.toString());
		log.info("list2 : {}", list2.toString());
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("workstateStats_year.do")
	public String workstateStats_year(int year, String type) throws Exception {
		ArrayList<Map<String, Object>> list1 = departmentStats(year, type);
		ArrayList<Employee> list2 = bestEmployee(year, type);
		
		log.info("연도별 통계 ");
		log.info("list1 : {}", list1.toString());
		log.info("list2 : {}", list2.toString());
		
		return "";
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
	
	@ResponseBody
	@RequestMapping(value ="/updateVacStatus.do")
	public String updateVacStatus(Vacation vac) throws Exception{
		
		log.info(vac.toString());
		
		wsService.updateVacStatus(vac);
		
		String name =wsService.getName(vac.getVac_no());
		
		log.info(name);
		return name;
	}
	
	@RequestMapping("deleteVacLog.do")
	public String deleteVacationLog(int vac_no) throws Exception {
	
		wsService.deleteVacationLog(vac_no);
		
		
		return "redirect:/vacationMgtMain.do";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "vacationDetail.do", produces = "application/text; charset =UTF-8")
	public String vacationDetail(int vac_no,HttpServletRequest request) throws Exception{
		log.info("상세조회할 휴가 글 번호: {}", vac_no);
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		Vacation vac = wsService.selectVacationDetail(vac_no);
		log.info("조회한 글 정보 : {}", vac.toString());
		
		//ArrayList<Employee> SupvEmp = empService.selectSupvEmpList(emp);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vac", vac);
		//map.put("SupvEmp", SupvEmp);
		
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "modifiedVacation.do", produces = "application/text; charset =UTF-8")
	public String modifiedVacation(Vacation vac, MultipartFile newFile,HttpServletRequest request) throws Exception{
		log.info("수정할 글: {}", vac.toString());
		
		if(newFile.getOriginalFilename() != null && !newFile.getOriginalFilename().equals("")) {
			fileService.deleteFile(String.valueOf(vac.getFile_no()));
			
			int file_no = fileService.uploadFile(newFile, request, "VA");
			vac.setFile_no(file_no);
			
		}
		
		log.info("수정할 글 완전판 : {}", vac.toString());
		wsService.modifiedVacation(vac);
		
		
		return"success";
	}
	
	
	

}
