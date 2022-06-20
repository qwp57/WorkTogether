package com.uni.wt.common.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class FileDto {
	
	private int file_no;
	private Date create_date;
	private String original_name;
	private String change_name;
	private Date modified_date;
	private String type;
	private String path;
	
	
	
	public FileDto(String original_name, String change_name, String path) {
		super();
		
		this.original_name = original_name;
		this.change_name = change_name;
		this.path = path;
	}

}
