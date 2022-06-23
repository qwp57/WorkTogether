package com.uni.wt.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.service.AdminServiceImpl;
import com.uni.wt.approval.model.dao.ApprovalMapper;
import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalMapper approvalMapper;
	
	@Override
	public ArrayList<Department> selectDeptList() throws Exception {
		
		return approvalMapper.selectDeptList();
	}

	@Override
	public ArrayList<Employee> selectEmpList() throws Exception {
		
		return approvalMapper.selectEmpList();
	}

}
