package com.uni.wt.common.notice.dto;

import lombok.Data;

@Data
public class Notice {
	
	private int notice_no;
	private int emp_no;
	private String type;
	private String content;
	private String contentDetail;
	private String url;
	private String create_date;
	private int count;
	
	

	public Notice(int notice_no, int emp_no, String type, String content, String contentDetail, String url) {
		super();
		this.notice_no = notice_no;
		this.emp_no = emp_no;
		this.type = type;
		this.content = content;
		this.contentDetail = contentDetail;
		this.url = url;
	}
	
	
	
	
}

