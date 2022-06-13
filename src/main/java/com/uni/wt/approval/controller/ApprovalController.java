package com.uni.wt.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	
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
	
	//일반 품의서로 이동
	@RequestMapping("letterOfApprovalEnrollForm.do")
	public String letterOfApprovalEnrollForm() {
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
}
