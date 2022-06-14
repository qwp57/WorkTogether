package com.uni.wt.workState.service;

import java.util.Map;

import javax.swing.Spring;

import com.uni.wt.workState.model.dto.WorkState;

public interface WorkStateService {

	int insertInTime(WorkState w) throws Exception;

	int updateOutTime(WorkState w)throws Exception;
	
	WorkState selectWorkState(String todaySeq) throws Exception;

	String updateWorkStatus(WorkState w)throws Exception;

	void deleteTodaySeq();

	Map<Spring, Object> selectMyWork() throws Exception;

	

}
