package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dao.RequestWorkMapper;
import com.uni.wt.requestWork.model.dto.RequestWork;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
@Primary
public class RequestWorkServiceImpl implements RequestService{
	
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

}
