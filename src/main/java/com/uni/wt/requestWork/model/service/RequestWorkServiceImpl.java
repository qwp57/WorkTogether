package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dao.RequestWorkMapper;
import com.uni.wt.requestWork.model.dto.RequestWork;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Primary
@Transactional(rollbackFor = Exception.class)
public class RequestWorkServiceImpl implements RequestService{
	private Map<String, Object> paramMap = new HashMap<String, Object>();
	
	@Autowired
	private RequestWorkMapper rwMapper;
	
	@Override
	public ArrayList<Object> selectDeptList() throws Exception {
		
		return rwMapper.selectDeptList();
	}

	@Override
	public ArrayList<Employee> getDeptMember(int dept_code) throws Exception {
		
		return rwMapper.getDeptMember(dept_code);
	}

	@Override
	public ArrayList<Project> selectProjectList(int emp_no) throws Exception {
		
		return rwMapper.selectProjectList(emp_no);
	}

	@Override
	public int insertRequestWork(RequestWork rw) throws Exception {
		
		int rwSeq = rwMapper.getRWSeq();
		
		rw.setRw_no(rwSeq);
		int result = rwMapper.insertRequestWork(rw);
		
		if(result > 0) {
			
			return rwSeq;
		}else {
			rw = null;
			return result;
		}
		
	}

	@Override
	public Map<String, Object> selectCountRw(int emp_no) throws Exception {
		
		return rwMapper.selectCountRw(emp_no);
	}

	@Override
	public int getListCount(int emp_no, String boardType) throws Exception {
		paramMap.put("boardType", boardType);
		paramMap.put("emp_no", emp_no);
		
		int result = rwMapper.getListCount(paramMap);
		paramMap.clear();
		
		
		return result;
	}

	@Override
	public ArrayList<RequestWork> selectRQList(int emp_no, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		
		return rwMapper.selectRQList(emp_no, rwB);
	}

	@Override
	public ArrayList<RequestWork> selectRSList(int emp_no, PageInfo pi) throws Exception {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		return  rwMapper.selectRSList(emp_no, rwB);
	}

}
