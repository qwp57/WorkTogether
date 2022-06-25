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

	public ArrayList<Employee> getDeptMember(Map<String, Object> paramMap)throws Exception;

	public ArrayList<Project> selectProjectList(int emp_no)throws Exception;

	public int insertRequestWork(RequestWork rw)throws Exception;

	public int getRWSeq()throws Exception;

	public RequestWork selectRWDetailsimple(int seqNo)throws Exception;

	public Map<String, Object> selectCountRw(int emp_no)throws Exception;

	public int getListCount(Map<String, Object> paramMap)throws Exception;

	public ArrayList<RequestWork> selectRQList(Map<String, Object> paramMap, RowBounds rwB)throws Exception;

	public ArrayList<RequestWork> selectRSList(Map<String, Object> paramMap, RowBounds rwB)throws Exception;

	public RequestWork selectRWDetail(String rw_no)throws Exception;

	public int cancleRW(RequestWork rw)throws Exception;

	public int updateRW(RequestWork rw)throws Exception;

	public int deleteRW(int rw_no)throws Exception;

	public int getCompleteListCount(Map<String, Object> paramMap)throws Exception;

	public ArrayList<RequestWork> completeRequest(Map<String, Object> paramMap, RowBounds rwB)throws Exception;



}
