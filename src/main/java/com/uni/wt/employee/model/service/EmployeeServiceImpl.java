package com.uni.wt.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.employee.model.dao.EmployeeMapper;
import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int idCheck(String userId) throws Exception{
		log.info("Service단에서 "+userId);
		int count = empMapper.idCheck(userId);
		log.info("Service단에서 "+count);
		return count;
	}

	@Override
	public void insertEmp(Employee emp) throws Exception{
		
		int result = empMapper.insertEmp(emp);
		
		if(result < 0) {
			throw new Exception("회원가입에 실패하였습니다.");
		}
		
	}

}
