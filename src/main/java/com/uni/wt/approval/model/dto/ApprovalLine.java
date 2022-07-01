package com.uni.wt.approval.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ApprovalLine {

	private int lineNo;					//결재선 번호
	private int approvalNo;				//결재문서 번호
	private int lineLevel;				//라인 레벨
	private int firstApproverNo;		//최초 결재자
	private String firstApproverName;	//최초 결재자 이름
	private String firstApproverJob;	//최초 결재자 직급
	private int finalApproverNo;		//최종 결재자
	private String finalApproverName;	//최종 결재자 이름
	private String finalApproverJob;	//최종 결재자 직급
	private int refereeNo;				//참조자
	//private String approvalSubmission;	
	private String progress;			//결재 진행
	private Date firstApprovalDate;		//최초 결재자 결재일
	private Date lastApprovalDate;		//최종 결재자 결재일
	private String rejectionReason; 	//반려 사유
	private String firstApprovalResult;
	private String finalApprovalResult;
}
