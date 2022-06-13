package com.uni.wt.workState.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.workState.model.dao.WorkStateMapper;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
@Primary
public class WorkStateServiceImpl implements WorkStateService{
	
	private int todaySeq;
	Map<String, Object> paramMap = new HashMap<String, Object>();
	
	@Autowired
	private WorkStateMapper wsMapper;

	@Override
	public String insertInTime(String emp_no) throws Exception {
		int empno = Integer.parseInt(emp_no);
		todaySeq = wsMapper.getSeq();
		log.info("todaySeq : {}", todaySeq);
		paramMap.put("emp_no", emp_no);
		paramMap.put("todaySeq", todaySeq);
		
		int result = wsMapper.insertInTime(paramMap);
		log.info("workStateService.insertInTime : {}", result);
		String msg = null;
		
		if(result > 0) {
			paramMap.clear();
			return "success";
		}else {
			throw new Exception("출근 등록에 실패했습니다. ");
		}
		
	}

}
