package com.uni.wt.workState.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.workState.model.dto.WorkState;

@Mapper
public interface WorkStateMapper {

	public int insertInTime(Map paramMap)throws Exception;

	public int getSeq()throws Exception;

	public int updateWorkState(Map<String, Object> paramMap)throws Exception;

	public int updateOutTime(Map<String, Object> paramMap)throws Exception;

	public WorkState selectWorkTime(int todaySeq)throws Exception;

	public String selectWorkState(String emp_no)throws Exception;

}
