package com.uni.wt.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {

	//단순 화면 전환
	@RequestMapping("adminApproval.do")
	public String adminApprovalPage() {
		return "admin/adminApprovalView";
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
