package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;

public interface RequestService {

	ArrayList<Object> selectDeptList() throws Exception;

	ArrayList<Employee> getDeptMember(int dept_code, int emp_no)throws Exception;

	ArrayList<Project> selectProjectList(int emp_no)throws Exception;

	int insertRequestWork(RequestWork rw)throws Exception;

	Map<String, Object> selectCountRw(int emp_no)throws Exception;

	int getListCount(int emp_no, String string)throws Exception;

	ArrayList<RequestWork> selectRQList(int emp_no, PageInfo pi, String sortVal)throws Exception;

	ArrayList<RequestWork> selectRSList(int emp_no, PageInfo pi, String sortVal)throws Exception;

	RequestWork selectRWDetail(String rw_no)throws Exception;

	void cancleRW(RequestWork rw)throws Exception;

	void updateRW(RequestWork rw)throws Exception;

	void deleteRW(int rw_no)throws Exception;

	int getCompleteListCount(int emp_no, String type, SearchDto sd)throws Exception;

	ArrayList<RequestWork> completeRequest(int emp_no, String type, SearchDto sd, PageInfo pi, String sort)throws Exception;


}
