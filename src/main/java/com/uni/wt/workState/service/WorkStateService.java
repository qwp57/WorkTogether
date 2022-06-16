package com.uni.wt.workState.service;

import java.util.ArrayList;
import java.util.Map;

import javax.swing.Spring;

import com.uni.wt.workState.model.dto.WorkState;

public interface WorkStateService {

	int insertInTime(WorkState w) throws Exception;

	int updateOutTime(WorkState w)throws Exception;
	
	WorkState selectWorkState(String todaySeq) throws Exception;

	String updateWorkStatus(WorkState w)throws Exception;

	void deleteTodaySeq();

	Map<Spring, Object> selectMyWork(String startday, int emp_no, ArrayList<String> weekHoliday) throws Exception;

	ArrayList<Integer> selectWorkTimeList(String startday, int emp_no) throws Exception;



	

}
