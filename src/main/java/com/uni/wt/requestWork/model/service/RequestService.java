package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;

public interface RequestService {

	ArrayList<Object> selectDeptList() throws Exception;

	ArrayList<Employee> getDeptMember(int dept_code)throws Exception;

	ArrayList<Project> selectProjectList(int emp_no)throws Exception;

	int insertRequestWork(RequestWork rw)throws Exception;

}
