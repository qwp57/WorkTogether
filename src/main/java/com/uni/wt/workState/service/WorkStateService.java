package com.uni.wt.workState.service;

import com.uni.wt.workState.model.dto.WorkState;

public interface WorkStateService {

	int insertInTime(String emp_no) throws Exception;

	int updateWorkState(String emp_no, String ws)throws Exception;

	int updateOutTime(String emp_no)throws Exception;
	
	WorkState selectWorkState(String todaySeq) throws Exception;

}
