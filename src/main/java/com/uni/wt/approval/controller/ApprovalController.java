package com.uni.wt.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.wt.admin.controller.AdminController;
import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.model.service.ApprovalService;
import com.uni.wt.employee.model.dto.Employee;

@Controller
public class ApprovalController {
	
	private static final Logger log = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService approvalService;
	
	//전자결재 홈으로 이동
	@RequestMapping("approvalMain.do")
	public String approvalMainPage() {
		return "approval/approvalMainView";
	}
	
	//기안 문서함으로 이동
	@RequestMapping("draftDocument.do")
	public String draftDocumentBoxPage() {
		return "approval/draftDocumentListView";
	}
	
	//결재 문서함으로 이동
	@RequestMapping("approvalDocument.do")
	public String approvalDocumentBoxPage() {
		return "approval/approvalDocumentListView";
	}
	
	//일반 품의서 작성으로 이동
	@RequestMapping("letterOfApprovalEnrollForm.do")
	public String letterOfApprovalEnrollForm(HttpServletRequest request, Model model) throws Exception {		
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();
		//세션에 로그인한 유저 정보
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("emp", emp);
		
		log.info("deptList : " + deptList);
		log.info("empList : " + empList);
		log.info("emp: " + emp.toString());
		
		return "approval/letterOfApprovalEnrollForm";
	}
	
	//일반 품의서 작성
	@RequestMapping("insertLetterOfApproval.do")
	public String insertLetterOfApproval() {
		return "approval/letterOfApprovalEnrollForm";
		
	}
	
	//지출 결의서로 이동
	@RequestMapping("expenditureEnrollForm.do")
	public String expenditureEnrollForm() {		
		return "approval/expenditureEnrollForm";
	}
	
	//회의록으로 이동
	@RequestMapping("theMinutesOfAMeetingEnrollForm.do")
	public String theMinutesOfAMeetingForm() {
		return "approval/theMinutesOfAMeetingEnrollForm";
	}
	
	//일반 품의서 디테일로 이동
	@RequestMapping("myDetailLetterOfApproval.do")
	public String selectMyLetterOfApproval() {
		return "approval/myLetterOfApprovalDetailView";
	}
	
	//지출 결의서 디테일로 이동
	@RequestMapping("myDetailExpenditure.do")
	public String selectMyExpenditure() {
		return "approval/myExpenditureDetailView";
	}
	
	//회의록 디테일로 이동
	@RequestMapping("myDetailtheMinutesOfAMeeting.do")
	public String selectMytheMinutesOfAMeeting() {
		return "approval/myTheMinutesOfAMeetingDetailView";
	}
	
	//일반 품의서 수정으로 이동
	@RequestMapping("updateMyLetterOfApproval.do")
	public String updateMyLetterOfApprovalForm() {
		return "approval/myLetterOfApprovalUpdateForm";
	}
	
	//지출 결의서 수정으로 이동
	@RequestMapping("updateMyExpenditure.do")
	public String updateMyExpenditureForm() {
		return "approval/myExpenditureUpdateForm";
	}
	
	//회의록 수정으로 이동
	@RequestMapping("updateMyTheMinutesOfAMeeting.do")
	public String updateMyTheMinutesOfAMeetingForm() {
		return "approval/myTheMinutesOfAMeetingUpdateForm";
	}
	
	//일반 품의서 결재 디테일로 이동
	@RequestMapping("appDetailLetterOfApproval.do")
	public String selectAppLetterOfApproval() {
		return "approval/appLetterOfApprovalDetailView";
	}
	
	//지출 결의서 결재 디테일로 이동
	@RequestMapping("appDetailExpenditure.do")
	public String selectAppExpenditure() {
		return "approval/appExpenditureDetailView";
	}
	
	//회의록 결재 디테일로 이동
	@RequestMapping("appDetailtheMinutesOfAMeeting.do")
	public String selectApptheMinutesOfAMeeting() {
		return "approval/appTheMinutesOfAMeetingDetailView";
	}
}
