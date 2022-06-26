package com.uni.wt.approval.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ApprovalMMinutes {
	private int approvalNo;
	private int lineNo;
	private String attendees;
	private String meetingPurpose;
	private Date meetingDate;
	private String meetingContent;
}
