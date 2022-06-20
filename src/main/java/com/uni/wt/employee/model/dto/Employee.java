package com.uni.wt.employee.model.dto;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class Employee {
	
	private int emp_no;
	@NotNull(message = "이름이 빈 값입니다.")
	private String name;
	
	@NotNull(message = "아이디가 빈 값입니다.")
	private String id;
	
	@NotNull(message = "비밀번호가 빈 값입니다.")
	private String password;
	
	@Email(message="이메일 형식이 아닙니다.")
	private String email;
	
	@NotNull(message = "전화번호가 빈 값입니다.")
	
	private String phone;
	
	@NotNull(message = "생일이 빈 값입니다.")
	private Date birth;
	
	private String dept_code;
	
	private String dept_name;
	
	private String upper_dept_code;
	
	private String job_code;
	
	private String job_name;
	
	@NotNull(message = "입사일이 빈 값입니다.")
	private Date join_date;
	
	private Date resignation_date;
	
	private String status;
	
	private String admin;
	
	private String file_no;
	
	private String create_date;
	
	private String reject_reason;
}