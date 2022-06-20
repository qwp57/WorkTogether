package com.uni.wt.workState.service;

import java.util.ArrayList;
import java.util.Map;

import javax.swing.Spring;

import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.workState.model.dto.Vacation;
import com.uni.wt.workState.model.dto.WorkState;

public interface WorkStateService {

	int insertInTime(WorkState w) throws Exception;

	int updateOutTime(WorkState w)throws Exception;
	
	WorkState selectWorkState(String todaySeq) throws Exception;

	String updateWorkStatus(WorkState w)throws Exception;

	void deleteTodaySeq();

	Map<Spring, Object> selectMyWork(String startday, int emp_no, ArrayList<String> weekHoliday) throws Exception;

	ArrayList<Integer> selectWorkTimeList(String startday, int emp_no) throws Exception;

	ArrayList<Object> selectTeamWorkList(Employee emp, ArrayList<String> weekHoliday, String startday, PageInfo pi)throws Exception;

	int selectTeamEmpCount(Employee emp);

	ArrayList<Object> selectTeamWeekList(Employee emp, String startday, PageInfo pi) throws Exception;

	ArrayList<Integer> selectVacDays(Employee emp)throws Exception;

	int insertVacation(Vacation vac);

	ArrayList<String> selectYears(Employee emp)throws Exception;

	ArrayList<Vacation> selectVacList(Employee emp, String tag,String year)throws Exception;

	int getTeamVacCount(String year, Employee emp, SearchDto sd)throws Exception;

	ArrayList<Vacation> selectTeamVacList(Employee emp, String year, PageInfo pi, SearchDto sd)throws Exception;

	ArrayList<String> getYearsCnt(Employee emp)throws Exception;





	

}
