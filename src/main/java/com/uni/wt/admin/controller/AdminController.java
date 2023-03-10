package com.uni.wt.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.dto.EmployeeSearchCondition;
import com.uni.wt.admin.model.service.AdminService;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

@Controller
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//부서 조회 -> 조직도
	@RequestMapping("/organizationChart.do")
	public String organizationChart(Model model) throws Exception {
		//부서 조회
		ArrayList<Department> deptList = adminService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= adminService.organizationEmpList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);		
		
		return "organizationChart/organizationChartView";
	}
	
	//조직도 모달
	@ResponseBody
	@RequestMapping(value="/empModal.do", produces = "application/json; charset=utf-8")
	public String empModal(int emp_no) throws Exception {
		
		Employee emp = adminService.empModal(emp_no);
		
		
		 return new Gson().toJson(emp);
	}
	
	//조직도 부서별
	@RequestMapping("/deptEmpList.do")
	public String organizationChartDeptEmpList(String deptName, String upperDeptCode, Model model) throws Exception {
		//부서 조회
		ArrayList<Department> deptList = adminService.selectDeptList();	
		//사원 조회
		ArrayList<Employee> empList = adminService.DeptEmpList(deptName);
		//인사 있는 부서 조회
		int upper_dept_code = Integer.parseInt(upperDeptCode);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptName",deptName);
		map.put("upper_dept_code",upper_dept_code);
		ArrayList<Department> deptEmpList = adminService.selectDeptEmpList(map);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("deptEmpList", deptEmpList);
		
		return "organizationChart/organizationChartView";
	}
	
	//가입 승인 리스트 조회
	@RequestMapping("/adminApprovalList.do")
	public String adminApprovalPage(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) throws Exception{
		
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
	@RequestMapping("/adminApproval.do")
	public String adminApproval(int empNo) {
		log.info("empNo:" + empNo);
		int result = adminService.adminApproval(empNo);
		log.info("result:" + result);
		
		return String.valueOf(result);
	}
	
	//가입 거부
	@ResponseBody
	@RequestMapping("/adminReject.do")
	public String adminReject(int empNo, String rComment) throws Exception {
		//파라미터를 2개 넘기기 위해서 HashMap 사용
		Map<String,Object> map = new HashMap<String,Object>();		
		map.put("empNo", empNo);
		map.put("rComment", rComment);
		
		log.info("rComment : " + rComment);
		
		int result = adminService.adminReject(map);
		
		return String.valueOf(result);
	}
	
	//가입 리스트 정렬
	@RequestMapping("/adminApprovalSortList.do")
	public String adminApprovalSort(String sortCondition, @RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage, Model model) throws Exception {
		//상태 변경 시 페이징 처리
		int listCount = adminService.approvalSortListCount(sortCondition);
				
		//페이지 정보		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		//list
		ArrayList<Employee> adminList = adminService.approvalSortList(sortCondition, pi);
		log.info("정렬 adminList : " + adminList);
				
		model.addAttribute("pi", pi);
		model.addAttribute("adminList", adminList);
		model.addAttribute("sortCondition", sortCondition);
		
		return "admin/adminApprovalView";
	}
	
	//관리자 - 부서 관리 
	//조회
	@RequestMapping("/departmentManagement.do")
	public String departmentManagementPage(Model model) throws Exception {
		//부서 조회
		ArrayList<Department> upperList = adminService.selectUpperList();
		//부서 숫자 조회
		int deptCount = adminService.deptCount();
		
		model.addAttribute("upperList", upperList);
		model.addAttribute("deptCount", deptCount);
		
		return "admin/departmentManagementView";
	}
	
	//부서 추가
	@ResponseBody
	@RequestMapping("/addDeptList.do")
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
	@RequestMapping("/deleteDeptList.do")
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
	@RequestMapping("/updateDept.do")
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
	@RequestMapping("/employeeManagement.do")
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
		log.info("인사관리리스트조회 empList : " + empList);
		return "admin/employeeManagementView";
	}
	
	//사원 추가
	@RequestMapping("/addEmployee.do")
	public String addEmployee(Employee emp, RedirectAttributes redirect) throws Exception {
		//비밀번호 암호화
		log.info("암호화 전 : " + emp.getPassword());
		String encPwd = bCryptPasswordEncoder.encode(emp.getPassword());
		log.info("암호화 후 : " + emp.getPassword());
		
		emp.setPassword(encPwd);
		
		//상위 부서 추가
		emp.setUpper_dept_code(adminService.addUpperDept(emp.getDept_code()));
		
		adminService.addEmployee(emp);
		log.info("emp : " + emp);

		redirect.addFlashAttribute("msg", "사원 추가가 완료 되었습니다.");
		
		return "redirect:employeeManagement.do";
	}
	
	//사원 정보 업데이트 뷰 이동
	@RequestMapping("/updateView.do")
	public ModelAndView updateView(int eno, ModelAndView mv) throws Exception {
		
		Employee selectEmp = adminService.updateView(eno);
		
		ArrayList<Department> deptList = adminService.selectUpperList();
		log.info("selectEmp : "+ selectEmp);
		mv.addObject("selectEmp", selectEmp).addObject("deptList", deptList).setViewName("admin/employeeManagementUpdateView");
		
		return mv;
	}
	
	//사원 정보 업데이트
	@RequestMapping("/updateEmployeeInfo.do")
	public ModelAndView updateEployee(Employee emp, @RequestParam(value="resignationDate", required = false) String resignationDate, ModelAndView mv) throws Exception {
		log.info("resignationDate : " + resignationDate);
		
		//상위 부서 추가
		emp.setUpper_dept_code(adminService.addUpperDept(emp.getDept_code()));
		
		//퇴직일이 있을 수도 있고 없을 수도 있다. -> 없는 경우에는 그냥 정보 업데이트, 있는 경우에는 상태까지 변경	
		if(resignationDate.equals("")) {
			adminService.updateEmployee(emp);
			log.info("정보 업데이트");
		}else {
			//포맷터
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("emp", emp);
			map.put("resignationDate", resignationDate);
			adminService.updateEmployeeResignation(map);
			log.info("정보 업데이트");
		}
		
		mv.addObject("eno", emp.getEmp_no()).setViewName("redirect:updateView.do");
		
		return mv;
	}
	
	//사원 검색
	@RequestMapping("/searchEmp.do")
	public ModelAndView searchEmp(EmployeeSearchCondition sc, @RequestParam(value="condition", required=false ) String condition, @RequestParam(value="keyword", required=false ) String keyword, ModelAndView mv, 
								@RequestParam(value="statusList", required=false )String statusList, @RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage) throws Exception {
		log.info("sc : " + sc);
		log.info("condition : " + condition);
		log.info("keyword : " + keyword);
		log.info("statusList : " + statusList);
		
		//받아온 condition이 무엇이냐에 따라 어디에 set해주냐가 달라짐
		if(condition != null) {
			switch(condition) {
			case "emp_no":
				sc.setEmp_no(keyword);
				break;
			case "name":
				sc.setName(keyword);
				break;
			case "dept_name" :
				sc.setDept_name(keyword);
				break;
			case "job_name" :
				sc.setJob_name(keyword);
				break;
			}
		}
		
		sc.setStatus(statusList);

		log.info("sc : " + sc);		
		//검색했을 때 페이징 처리를 위한 count
		int listCount = adminService.searchListCount(sc);
		log.info("listCount : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		log.info("pi : " + pi);
		
		ArrayList<Employee> empList = adminService.searchEmpList(sc, pi);
		
		mv.addObject("empList", empList);
		mv.addObject("pi", pi);
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);		
		mv.addObject("statusList", sc.getStatus());
		
		log.info("검색 empList " + empList);
		log.info("검색 condition " + condition);
		log.info("검색 keyword " + keyword);
		
		
		mv.setViewName("admin/employeeManagementView");
		
		return mv;
	}

}
