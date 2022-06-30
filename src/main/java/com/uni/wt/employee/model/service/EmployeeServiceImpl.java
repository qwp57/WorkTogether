package com.uni.wt.employee.model.service;

import java.util.ArrayList;
import java.util.Map;

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
		
		//에러뜨면 롤백되는거 확인
	}

	@Override
	public Employee loginEmp(Employee emp) throws Exception {
		
		Employee result = empMapper.loginEmp(emp);
		
		return result;
	}

	@Override
	public ArrayList<Employee> selectSupvEmpList(Employee emp) throws Exception {//WorkStateController에서 씀 
		
		ArrayList<Employee> result = empMapper.selectSupvEmpList(emp);
		
		log.info("[결재자 목록] : {}",result.toString());
		
		return result;
	}

	@Override
	public ArrayList<Map<String, String>> getDetpList() throws Exception {
		// TODO Auto-generated method stub
		return empMapper.getDetpList();
	}

	@Override
	public ArrayList<Map<String, String>> getJobList() throws Exception {
		// TODO Auto-generated method stub
		return empMapper.getJobList();
	}

	@Override
	public Employee myProfileUpdate(Employee emp) throws Exception {
		
		int result = empMapper.myProfileUpdate(emp);
		
		if(result > 0) {
			
			return empMapper.selectUpdatedEmp(emp.getEmp_no());
			
		}else {
			throw new Exception("개인정보 수정에 실패했습니다.");
		}
		
		
	}

}
