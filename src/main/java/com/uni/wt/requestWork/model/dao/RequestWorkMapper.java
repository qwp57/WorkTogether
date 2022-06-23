package com.uni.wt.requestWork.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;

@Mapper
public interface RequestWorkMapper {

	public ArrayList<Object> selectDeptList()throws Exception;

	public ArrayList<Employee> getDeptMember(int dept_code)throws Exception;

	public ArrayList<Project> selectProjectList(int emp_no)throws Exception;

	public int insertRequestWork(RequestWork rw)throws Exception;

	public int getRWSeq()throws Exception;

	public RequestWork selectRWDetail(int seqNo)throws Exception;

	public Map<String, Object> selectCountRw(int emp_no)throws Exception;

	public int getListCount(Map<String, Object> paramMap)throws Exception;

	public ArrayList<RequestWork> selectRQList(int emp_no, RowBounds rwB)throws Exception;

	public ArrayList<RequestWork> selectRSList(int emp_no, RowBounds rwB)throws Exception;

}
