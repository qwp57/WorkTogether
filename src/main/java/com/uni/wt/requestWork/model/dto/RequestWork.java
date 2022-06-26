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
	private String term;
	private String important;
	private String status;
	private String status_message;
	private String create_date;
	private String modified_date;
	private String req_file;
	private String res_file;
	
	////////////////////////////
	private String pj_title;
	//private String termYN;
	private String type;
	////////////////////////////
	private String req_file_change;
	private String res_file_change;
	private String req_file_origin;
	private String res_file_origin;

}
