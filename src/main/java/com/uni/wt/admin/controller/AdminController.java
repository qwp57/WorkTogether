package com.uni.wt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.wt.admin.model.dto.Department;
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
	
	//가입 승인 리스트 조회
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
	@RequestMapping("adminReject.do")
	public String adminReject(int empNo, String rComment) throws Exception {
		//파라미터를 2개 넘기기 위해서 HashMap 사용
		Map<String,Object> map = new HashMap<String,Object>();		
		map.put("empNo", empNo);
		map.put("rComment", rComment);
		
		log.info("rComment : " + rComment);
		
		int result = adminService.adminReject(map);
		
		return String.valueOf(result);
	}
	
	//관리자 - 부서 관리 
	//조회
	@RequestMapping("departmentManagement.do")
	public String departmentManagementPage(Model model) throws Exception {
		
		ArrayList<Department> upperList = adminService.selectUpperList();
		
		model.addAttribute("upperList", upperList);
		
		return "admin/departmentManagementView";
	}
	
	//부서 추가
	@ResponseBody
	@RequestMapping("addDeptList.do")
	public String addDeptList(int upperDeptName, String addDeptName) {		
		//파라미터를 2개 넘기기 위해서 HashMap 사용
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("upperDeptCode", upperDeptName);
		map.put("addDeptName", addDeptName); //추가부 이름		
		
		log.info("addDeptName " + addDeptName);
		log.info("upperDeptCode " + upperDeptName);
		
		int result = adminService.addDeptList(map);
		
		return String.valueOf(result);
	}
	
	//부서 삭제
	@ResponseBody
	@RequestMapping("deleteDeptList.do")
	public String deleteDeptList(@RequestParam(value="checkBoxArr[]") List<Integer> checkBoxArr) { //@RequestParam(value="parameter이름[]")List<String> 형으로 받아와야 한다.
		//ajax에 보낼 result 선언
		int result=0;
		
		//받아온 배열 반복문 돌림
		for(int deptCode : checkBoxArr) {
			result = adminService.deleteDeptList(deptCode);
		}
		
		return String.valueOf(result);
	}
	
	//부서 수정
	@ResponseBody
	@RequestMapping("updateDept.do")
	public String updateDeptList(@RequestParam(value="checkBoxArr[]") List<Integer> checkBoxArr, @RequestParam(value="updateList[]") List<String> updateList) {
		//ajax에 보낼 result 선언
		int result=0;
		
		//checkBoxArr과 updateList를 담을 map 선언
		Map<String,Object> map = new HashMap<String,Object>();
		
		for(int i=0; i < checkBoxArr.size(); i++) {
			map.put("deptCode", Integer.parseInt(String.valueOf(checkBoxArr.get(i))));			
			map.put("deptName", String.valueOf(updateList.get(i)));
			
			log.info(updateList.get(i));
			
			result = adminService.updateDeptList(map);
		}
		
		return String.valueOf(result);
	}
	
	//인사 관리 리스트 조회
	@RequestMapping("employeeManagement.do")
	public String employeeManagementPage(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) throws Exception {
		
		//총 게시글 개수
		int listCount = adminService.empListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> empList = adminService.selectEmpList(pi);
		//부서 조회
		ArrayList<Department> deptList = adminService.selectUpperList();
		log.info("deptList : " + deptList);
		model.addAttribute("pi", pi);
		model.addAttribute("empList", empList);
		model.addAttribute("deptList", deptList);
		
		return "admin/employeeManagementView";
	}
	
	//사원 추가
	@RequestMapping("addEmployee.do")
	public String addEmployee(Employee emp, Model model) throws Exception {
		
		adminService.addEmployee(emp);
		
		model.addAttribute("msg", "사원 추가가 완료되었습니다.");
		
		return "admin/employeeManagementView";
	}
}
