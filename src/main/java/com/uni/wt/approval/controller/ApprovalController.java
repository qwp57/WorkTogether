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
	
	@RequestMapping("updateMyExpenditure.do")
	public String updateMyExpenditureForm() {
		return "approval/myExpenditureUpdateForm";
	}
	
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
