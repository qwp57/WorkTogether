package com.uni.wt.approval.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ApprovalLine {

	private int lineNo;					//결재선 번호
	private int approvalNo;			//결재문서 번호
	private int lineLevel;				//라인 레벨
	private int firstApproverNo;		//최초 결재자
	private int finalApproverNo;		//최종 결재자
	private int refereeNo;				//참조자
	//private String approvalSubmission;	
	private String progress;			//결재 진행
	private Date firstApprovalDate;		//최초 결재자 결재일
	private Date lastApprovalDate;		//최종 결재자 결재일
	private String rejectionReason; 	//반려 사유
}
