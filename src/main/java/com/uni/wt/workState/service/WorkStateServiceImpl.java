package com.uni.wt.workState.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.workState.model.dao.WorkStateMapper;
import com.uni.wt.workState.model.dto.WorkState;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
@Primary
public class WorkStateServiceImpl implements WorkStateService{
	
	private static int todaySeq;
	Map<String, Object> paramMap = new HashMap<String, Object>();
	
	@Autowired
	private WorkStateMapper wsMapper;

	@Override
	public int insertInTime(WorkState w) throws Exception {
		
		todaySeq = wsMapper.getSeq();
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
		
		log.info("todaySeq : {}", todaySeq);
		w.setWork_no(todaySeq);
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
		
			w = wsMapper.selectWorkTime(todaySeq);

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
		todaySeq = 0;
		
	}


	@Override
	public Map<Spring, Object> selectMyWork(String startday, int emp_no, ArrayList<String> weekHoliday) throws Exception {
		
		paramMap.put("startday", startday);
		paramMap.put("emp_no", emp_no);
		paramMap.put("weekHoliday", weekHoliday);
		
		Map<Spring, Object> resultMap = wsMapper.selectMyWork(paramMap);
		
		paramMap.clear();
		
		if(resultMap ==null) {
			throw new Exception("내 근태관리 데이터 조회에 실패했습니다");
		}
		
		return resultMap;
	}


	@Override
	public ArrayList<Integer> selectWorkTimeList(String startday, int emp_no) throws Exception {//하루에 몇 시간 일했나 
		
		paramMap.put("startday", startday);
		paramMap.put("emp_no", emp_no);
		
		 ArrayList<Integer> resultList = wsMapper.selectWorkTimeList(paramMap);
		// TODO Auto-generated method stub
		return resultList;
	}




}
