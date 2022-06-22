package com.uni.wt.common.notice.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	
	private int notice_no;
	private int emp_no;
	private String type;
	private String content;
	private String url;
	private Date create_date;
	private int count;
	
	
	public Notice(int emp_no, String type, String content, String url) {
		super();
		this.emp_no = emp_no;
		this.type = type;
		this.content = content;
		this.url = url;
	}
	
	
	
	
}

