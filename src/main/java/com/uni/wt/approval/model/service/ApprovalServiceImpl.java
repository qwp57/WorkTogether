package com.uni.wt.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.controller.ApprovalController;
import com.uni.wt.approval.model.dao.ApprovalMapper;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalExpenditure;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.approval.model.dto.ApprovalMMinutes;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ApprovalServiceImpl implements ApprovalService {
	
	private static final Logger log = LoggerFactory.getLogger(ApprovalServiceImpl.class);
	
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
			throw new Exception("기안서 등록에 실패하였습니다.");
		}
	}

	@Override
	public void insertApprovalLine1(ApprovalLine appL) throws Exception {
		
		int result = approvalMapper.insertApprovalLine1(appL);
		
		if(result < 0) {
			throw new Exception("결재선 등록에 실패하였습니다.");
		}
	}

	@Override
	public void insertApprovalLine2(ApprovalLine appL) throws Exception {
		
		int result = approvalMapper.insertApprovalLine2(appL);
		
		if(result < 0) {
			throw new Exception("결재선 등록에 실패하였습니다.");
		}
		
	}
	
	@Override
	public void insertLoa(ApprovalLoa loa) throws Exception {
		
		int result = approvalMapper.insertLoa(loa);
		
		if(result < 0) {
			throw new Exception("품의서 등록에 실패하였습니다.");
		}
		
	}

	@Override
	public void insertExpenditure(ApprovalExpenditure appEx) throws Exception {
		
		int result = approvalMapper.insertExpenditure(appEx);
		
		if(result < 0) {
			throw new Exception("지출결의서 등록에 실패하였습니다.");
		}
	}

	@Override
	public void insertMminutes(ApprovalMMinutes appMm) throws Exception {
		
		int result = approvalMapper.insertMminutes(appMm);
		
		if(result < 0) {
			throw new Exception("회의록 등록에  실패하였습니다.");
		}
		
	}

	@Override
	public int draftListCount(int emp_no) throws Exception {
		
		return approvalMapper.draftListCount(emp_no);
	}

	@Override
	public ArrayList<Approval> selectDraftList(int emp_no, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return approvalMapper.selectDraftList(emp_no, rowBounds);
	}

	@Override
	public int searchListCount(Map<String, Object> map) throws Exception {		
		
		return approvalMapper.searchListCount(map);
	}

	@Override
	public ArrayList<Approval> searchDraftList(Map<String, Object> map, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return approvalMapper.searchDraftList(map, rowBounds);
	}

	@Override
	public Approval selectApproval(int approvalNo) throws Exception {
		
		Approval app = approvalMapper.selectApproval(approvalNo);
		
		if(app == null) {
			new Exception("기안서 조회에 실패하였습니다.");
		}
		
		return app;
	}

	@Override
	public ApprovalLine selectApprovalLine(int approvalNo) throws Exception {
		
		ApprovalLine appL = approvalMapper.selectApprovalLine(approvalNo);
		
		if(appL == null) {
			new Exception("결재선 조회에 실패하였습니다.");
		}
				
		return appL;
	}

	@Override
	public ApprovalLoa selectApprovalLoa(int approvalNo) throws Exception {
		
		ApprovalLoa loa = approvalMapper.selectApprovalLoa(approvalNo);
		
		if(loa == null) {
			new Exception("일반 품의서 조회에 실패하였습니다.");
		}
		
		return loa;
	}

	@Override
	public ApprovalExpenditure selectApprovalExpenditure(int approvalNo) throws Exception {
		
		ApprovalExpenditure appEx = approvalMapper.selectApprovalExpenditure(approvalNo);
		
		if(appEx == null) {
			new Exception("지출 결의서 조회에 실패하였습니다.");
		}
		
		return appEx;
	}

	@Override
	public ApprovalMMinutes selectApprovaltheMinutesOfAMeeting(int approvalNo) throws Exception {
		
		ApprovalMMinutes appMm = approvalMapper.selectApprovaltheMinutesOfAMeeting(approvalNo);
		
		if(appMm == null) {
			new Exception("회의록 조회에 실패하였습니다.");
		}
		
		return appMm;
	}


}
