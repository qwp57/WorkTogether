package com.uni.wt.approval.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Approval {
	
	private String approvalNo;  //결재 문서 번호
	private int docNo; 		    //기안서 양식 번호
	private int lineNo;		    //결재선 번호
	private int writer;		    //기안자
	private String deptName;    //부서 이름
	private int retentionPeriod;//보존 년한
	private String title;		//제목
	private Date createDate;	//기안일
	private Date approvalDate;	//결재완료일
	private String emergency;	//긴급
	private String progress;	//결재 진행 상태
	private String rejectionReason; //반려 사유
	private int fileNo;			//파일 번호
	
}
