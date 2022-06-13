package com.uni.wt.workState.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class WorkState {
	
	private int work_no;
	private String emp_no;
	private Date in_time;
	private Date out_time;
	private String status;

}
