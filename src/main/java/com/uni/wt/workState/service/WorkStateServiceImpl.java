package com.uni.wt.workState.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.Spring;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.workState.model.dao.WorkStateMapper;
import com.uni.wt.workState.model.dto.Vacation;
import com.uni.wt.workState.model.dto.WorkState;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
@Primary
public class WorkStateServiceImpl implements WorkStateService{
	
	
	private Map<String, Object> paramMap = new HashMap<String, Object>();
	
	@Autowired
	private WorkStateMapper wsMapper;

	@Override
	public int insertInTime(WorkState w) throws Exception {
		
		int todaySeq = wsMapper.getSeq();
		log.info("todaySeq : {}", todaySeq);
		w.setWork_no(todaySeq);
		
		int result = wsMapper.insertInTime(w);
		log.info("workStateService.insertInTime : {}", result);
				
		if(result > 0) {
			log.info("출근 등록 결과 : {}", result);
			log.info("근무상태 근무중으로 변경 시작");
			w.setStatus("W");
			result += wsMapper.updateWorkStatus(w);
			
			return result;
		}else {
			throw new Exception("출근 등록에 실패했습니다. ");
		}
		
	}


	@Override
	public int updateOutTime(WorkState w) throws Exception {
		
		String temp = wsMapper.getWorkNO(w.getEmp_no());
		
		int workNo = Integer.parseInt( temp== null ? "0" : temp);
		
		w.setWork_no(workNo);
		int result = wsMapper.updateOutTime(w);
		log.info("workStateService.updateOutTime : {}", result);
		
		if(result > 0) {
			log.info("퇴근 등록 결과 : {}", result);
			log.info("근무상태 퇴근으로 변경 시작");
			w.setStatus("LW");
			result += wsMapper.updateWorkStatus(w);
			return result;
		}else {
			throw new Exception("퇴근 등록에 실패했습니다. ");
		}
		
	}

	@Override
	public WorkState selectWorkState(String emp_no) throws Exception {
			WorkState w = null;
			String temp = wsMapper.getWorkNO(emp_no);
			
			int workNo = Integer.parseInt( temp== null ? "0" : temp);
		
			w = wsMapper.selectWorkTime(workNo);

			if(w != null) {
				
			log.info(w.toString());
			w.setStatus(wsMapper.selectWorkState(emp_no));
			w.setOut_time((w.getOut_time() != null) ? w.getOut_time() : "00:00:00");
			log.info(w.toString());

			}else {
				w = new WorkState();
				w.setIn_time("00:00:00");
				w.setOut_time("00:00:00");
				w.setStatus("근무시작 전");
			}
			
		return w;
	
	}


	@Override
	public String updateWorkStatus(WorkState w) throws Exception {
		
		log.info(w.toString());
		
		int resNum = wsMapper.updateWorkStatus(w);
		
		if(resNum >0) {
			return "success";
		}else {
			return "fail";
		}
	}


	@Override
	public void deleteTodaySeq() {
		
		
	}


	@Override
	public Map<Spring, Object> selectMyWork(String startday, int emp_no, ArrayList<String> weekHoliday) throws Exception {
		
		paramMap.put("startday", startday);
		paramMap.put("emp_no", emp_no);
		paramMap.put("weekHoliday", weekHoliday);
		
		Map<Spring, Object> resultMap = wsMapper.selectMyWork(paramMap);
		
		paramMap.clear();
		
		return resultMap;
	}


	@Override
	public ArrayList<Integer> selectWorkTimeList(String startday, int emp_no) throws Exception {//하루에 몇 시간 일했나 
		
		paramMap.put("startday", startday);
		paramMap.put("emp_no", emp_no);
		
		 ArrayList<Integer> resultList = wsMapper.selectWorkTimeList(paramMap);
		 
		 paramMap.clear();
		
		return resultList;
	}


	@Override
	public ArrayList<Object> selectTeamWorkList(Employee emp, ArrayList<String> weekHoliday, String startday, PageInfo pi)
			throws Exception {
		
		//int offset = (pi)
		
		paramMap.put("startday", startday);
		paramMap.put("weekHoliday", weekHoliday);
		paramMap.put("emp", emp);
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Object> resultMap = wsMapper.selectTeamWorkList(paramMap, rwB);
		paramMap.clear();
		
		
		
		
		return resultMap;
	}


	@Override
	public int selectTeamEmpCount(Employee emp) {
		
		
		return wsMapper.selectTeamEmpCount(emp);
	}


	@Override
	public ArrayList<Object> selectTeamWeekList(Employee emp, String startday, PageInfo pi) throws Exception {// 팀원들 일주일 근무시간 리스트 
		
		String[] dayArr = {"SUN", "MON", "TUE", "WED", "THU","FRI","SAT"};
		paramMap.put("startday", startday);
		paramMap.put("emp", emp);
		paramMap.put("dayArr", dayArr);
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Object> resultMap = wsMapper.selectTeamWeekList(paramMap, rwB);
		paramMap.clear();
		
		return resultMap;
	}


	@Override
	public ArrayList<Integer> selectVacDays(Employee emp) throws Exception {
		
		ArrayList<Integer> result = wsMapper.selectVacDays(emp);
		log.info("[휴가 남은 일수] : {}", result.toString());
		
		return result;
	}


	@Override
	public int insertVacation(Vacation vac) {
		
		int result;
		try {
			result = wsMapper.insertVacation(vac);
		
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		
		return result;
	}


	@Override
	public ArrayList<String> selectYears(Employee emp) throws Exception {
		
		return wsMapper.selectYears(emp);
	}


	@Override
	public ArrayList<Vacation> selectVacList(Employee emp, String tag, String year) throws Exception {
		paramMap.put("tag", tag);
		paramMap.put("emp", emp);
		paramMap.put("year", year);
		 ArrayList<Vacation> result = wsMapper.selectVacList(paramMap);
		paramMap.clear();
		return result ;
	}


	@Override
	public int getTeamVacCount(String year, Employee emp, SearchDto sd) throws Exception {
		paramMap.put("year", year);
		paramMap.put("emp", emp);
		paramMap.put("sd", sd);
		int cnt = wsMapper.getTeamVacCount(paramMap);
		paramMap.clear();
		log.info("[전체 휴가내역 개수] : {}", cnt);
		return cnt;
	}


	@Override
	public ArrayList<Vacation> selectTeamVacList(Employee emp, String year, PageInfo pi, SearchDto sd) throws Exception {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		paramMap.put("year", year);
		paramMap.put("emp", emp);
		paramMap.put("sd", sd);
		
		ArrayList<Vacation> result = wsMapper.selectTeamVacList(paramMap, rwB);
		log.info("[팀원들 휴가 내역] : {} ", result.toString());
		paramMap.clear();
		return result;
	}


	@Override
	public ArrayList<String> getYearsCnt(Employee emp) throws Exception {
		
		return wsMapper.getYearsCnt(emp);
	}


	@Override
	public void updateVacStatus(Vacation vac) throws Exception {
		int result = wsMapper.updateVacStatus(vac);
		
		if(result <= 0) {
			throw new Exception("휴가 신청서 상태 변경에 실패했습니다.");
		}
		
	}


	@Override
	public String getName(int vac_no) throws Exception {
		
		return wsMapper.getName(vac_no);
	}


	@Override
	public void deleteVacationLog(int vac_no) throws Exception {
		
		int result = wsMapper.deleteVacationLog(vac_no);
		
		if(result <=0) {
			throw new Exception("휴가내역 삭제에 실패했습니다.");
		}
		
	}


	






}
