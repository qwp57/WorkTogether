package com.uni.wt.admin.model.dto;

import lombok.Data;

@Data
public class Department {
	
	private int deptCode; 		//부서 코드
	private String deptName;	//부서 이름
	private int deptLevel;		//부서 레벨
	private int upperDeptCode;	//상위 부서 코드
}