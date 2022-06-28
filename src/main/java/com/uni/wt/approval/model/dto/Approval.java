package com.uni.wt.approval.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Approval {
	
	private int approvalNo;  //결재 문서 번호
	private int docNo; 		    //기안서 양식 번호
	private String docName;		//기안 양식 이름
	private int writer;		    //기안자
	private String name;			//기안자 이름
	private String deptName;    //부서 이름
	private int retentionPeriod;//보존 년한
	private String title;		//제목
	private Date createDate;	//기안일
	private Date approvalDate;	//결재완료일
	private String emergency;	//긴급
	private String progress;	//결재 진행 상태
	private int fileNo;			//파일 번호
	
}
