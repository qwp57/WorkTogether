package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;

public interface RequestService {

	ArrayList<Object> selectDeptList() throws Exception;

	ArrayList<Employee> getDeptMember(int dept_code)throws Exception;

	ArrayList<Project> selectProjectList(int emp_no)throws Exception;

	int insertRequestWork(RequestWork rw)throws Exception;

	Map<String, Object> selectCountRw(int emp_no)throws Exception;

	int getListCount(int emp_no, String string)throws Exception;

	ArrayList<RequestWork> selectRQList(int emp_no, PageInfo pi)throws Exception;

	ArrayList<RequestWork> selectRSList(int emp_no, PageInfo pi)throws Exception;;

}
