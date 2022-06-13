package com.uni.wt.workState.service;

import java.util.HashMap;
import java.util.Map;

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
	public int insertInTime(String emp_no) throws Exception {
		
		todaySeq = wsMapper.getSeq();
		log.info("todaySeq : {}", todaySeq);
		paramMap.put("emp_no", emp_no);
		paramMap.put("todaySeq", todaySeq);
		
		int result = wsMapper.insertInTime(paramMap);
		log.info("workStateService.insertInTime : {}", result);
		
		
		if(result > 0) {
			paramMap.clear();
			log.info("출근 등록 결과 : {}", result);
			log.info("근무상태 근무중으로 변경 시작");
			result += updateWorkState(emp_no, "W");
			
			return result;
		}else {
			throw new Exception("출근 등록에 실패했습니다. ");
		}
		
	}

	@Override
	public int updateWorkState(String emp_no, String ws) throws Exception {
		int empno = Integer.parseInt(emp_no);
		paramMap.put("emp_no", emp_no);
		paramMap.put("ws", ws);
		log.info("{}으로 근무상태 변경", ws);
		int result = wsMapper.updateWorkState(paramMap);
		log.info("workStateService.updateWorkState : {}", result);
		
		if(result > 0) {
			paramMap.clear();
			return result;
		}else {
			throw new Exception("근무상태 변경에 실패했습니다.");
		}
		
		
	}

	@Override
	public int updateOutTime(String emp_no) throws Exception {
		
		log.info("todaySeq : {}", todaySeq);
		paramMap.put("emp_no", emp_no);
		paramMap.put("todaySeq", todaySeq);
		int result = wsMapper.updateOutTime(paramMap);
		log.info("workStateService.updateOutTime : {}", result);
		
		if(result > 0) {
			paramMap.clear();
			log.info("퇴근 등록 결과 : {}", result);
			log.info("근무상태 퇴근으로 변경 시작");
			result += updateWorkState(emp_no, "LW");
			todaySeq = 0;
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
			log.info(w.toString());
		}
		return w;
	
	}

}
