package com.uni.wt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.wt.admin.model.service.AdminService;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

@Controller
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	//부서 조회
	@RequestMapping("organizationChart.do")
	public String organizationChart(Model model) {

		return "organizationChart/organizationChartView";
	}
	
	//가입 승인
	@RequestMapping("adminApprovalList.do")
	public String adminApprovalPage(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) {
		
		//총 페이지 개수
		int listCount = adminService.selectListCount();
		log.info("페이지 개수 : " + listCount);
		
		//페이지 정보를 담고 있는 객체 생성
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> adminList = adminService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("adminList", adminList);
		
		return "admin/adminApprovalView";
	}
	
	//가입 승인 버튼 클릭 -> 사원 상태 값 w -> i
	@ResponseBody
	@RequestMapping(value="adminApproval.do")
	public String adminApproval(int empNo) {
		log.info("empNo:" + empNo);
		int result = adminService.adminApproval(empNo);
		log.info("result:" + result);
		
		return String.valueOf(result);
	}
	
	//가입 거부
	@ResponseBody
	@RequestMapping(value="adminReject.do")
	public String adminReject(int empNo, String rComment) throws Exception {
		
		//파라미터를 2개 넘기기 위해서 HashMap 사용
		Map<String,Object> map = new HashMap<String,Object>();		
		map.put("empNo", empNo);
		map.put("rComment", rComment);
		
		int result = adminService.adminReject(map);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("departmentManagement.do")
	public String departmentManagementPage() {
		return "admin/departmentManagementView";
	}
	
	@RequestMapping("employeeManagement.do")
	public String employeeManagementPage() {
		return "admin/employeeManagementView";
	}
}
