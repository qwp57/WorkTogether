package com.uni.wt.workState.model.dto;

import java.sql.Date;

import lombok.Data;


@Data
public class Vacation {
	private int vac_no;
	private String emp_no;
	private String vcategory_no;
	private Date start_date;
	private Date end_date;
	private Date request_date;
	private Date response_date;
	private String content;
	private int file_no;
	private String status;
	private String approval_no;
	
	private String fileOriginName;
	private String fileChangeName;
	private int totaldays;
	
	////////////////////EMPLOYEE
	private String job;
}
