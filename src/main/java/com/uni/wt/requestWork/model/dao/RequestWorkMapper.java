package com.uni.wt.requestWork.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

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

}
