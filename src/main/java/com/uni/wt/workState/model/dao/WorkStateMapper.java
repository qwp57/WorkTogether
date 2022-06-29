package com.uni.wt.workState.model.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.swing.Spring;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.workState.model.dto.Vacation;
import com.uni.wt.workState.model.dto.WorkState;

@Mapper
public interface WorkStateMapper {

	public int insertInTime(WorkState w)throws Exception;

	public int getSeq()throws Exception;

	public int updateWorkStatus(WorkState w)throws Exception;

	public int updateOutTime(WorkState w)throws Exception;

	public WorkState selectWorkTime(int todaySeq)throws Exception;//메인에 근무상태 조회

	public String selectWorkState(String emp_no)throws Exception;

	public Map<Spring, Object> selectMyWork(Map<String, Object> paramMap)throws Exception;

	public ArrayList<Integer> selectWorkTimeList(Map<String, Object> paramMap)throws Exception;

	public String getWorkNO(String emp_no)throws Exception;

	public int selectTeamEmpCount(Employee emp);

	public ArrayList<Object> selectTeamWorkList(Map<String, Object> paramMap, RowBounds rwB) throws Exception;

	public ArrayList<Object> selectTeamWeekList(Map<String, Object> paramMap, RowBounds rwB) throws Exception;

	public ArrayList<Integer> selectVacDays(Employee emp) throws Exception;

	public int insertVacation(Vacation vac) throws Exception;

	public ArrayList<String> selectYears(Employee emp)throws Exception;

	public ArrayList<Vacation> selectVacList(Map<String, Object> paramMap)throws Exception;

	public int getTeamVacCount(Map<String, Object> paramMap)throws Exception;

	public ArrayList<Vacation> selectTeamVacList(Map<String, Object> paramMap, RowBounds rwB)throws Exception;

	public ArrayList<String> getYearsCnt(Employee emp)throws Exception;

	public int updateVacStatus(Vacation vac)throws Exception;

	public String getName(int vac_no)throws Exception;

	public int deleteVacationLog(int vac_no)throws Exception;

	

	


}
