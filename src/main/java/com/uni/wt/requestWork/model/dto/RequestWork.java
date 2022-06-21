package com.uni.wt.requestWork.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class RequestWork {
	
	private int rw_no;
	private String req_member;
	private String res_member;
	private String title;
	private String content;
	private String pj_no;
	private Date term;
	private String important;
	private String status;
	private String status_message;
	private Date create_date;
	private Date modified_date;
	private String req_file;
	private String res_file;
	
	////////////////////////////
	private String pj_title;
	private String termYN;

}
