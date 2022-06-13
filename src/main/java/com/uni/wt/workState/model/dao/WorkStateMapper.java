package com.uni.wt.workState.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkStateMapper {

	public int insertInTime(Map paramMap)throws Exception;

	public int getSeq();

}
