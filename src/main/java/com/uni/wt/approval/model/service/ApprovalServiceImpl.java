package com.uni.wt.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.service.AdminServiceImpl;
import com.uni.wt.approval.model.dao.ApprovalMapper;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
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

	@Override
	public void insertApproval(Approval app) throws Exception {
		
		int result = approvalMapper.insertApproval(app);
		
		if(result < 0) {
			throw new Exception("기안서 등록 실패");
		}
	}

	@Override
	public void insertApprovalLine1(ApprovalLine appL) throws Exception {
		
		int result = approvalMapper.insertApprovalLine1(appL);
		
		if(result < 0) {
			throw new Exception("결재선 등록 실패");
		}
	}

	@Override
	public void insertApprovalLine2(ApprovalLine appL) throws Exception {
		
		int result = approvalMapper.insertApprovalLine2(appL);
		
		if(result < 0) {
			throw new Exception("결재선 등록 실패");
		}
		
	}
	

	@Override
	public void insertLoa(ApprovalLoa loa) throws Exception {
		
		int result = approvalMapper.insertLoa(loa);
		
		if(result < 0) {
			throw new Exception("품의서 등록 실패");
		}
		
	}

}
