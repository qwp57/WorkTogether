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
	public ArrayList<Approval> mainApprovalWaitingList(int empNo) {
		
		ArrayList<Approval> appList = approvalMapper.mainApprovalWaitingList(empNo);
		
		return appList;
	}
		
	@Override
	public ArrayList<Department> selectDeptList() throws Exception {
		
		return approvalMapper.selectDeptList();
	}

	@Override
	public ArrayList<Employee> selectEmpList() throws Exception {
		
		return approvalMapper.selectEmpList();
	}
	
	@Override
	public int approvalWaitCount(int empNo) throws Exception {
		
		int waitCount = approvalMapper.approvalWaitCount(empNo);
		
		return waitCount;
	}
	
	@Override
	public int approvalCompleteCount(int empNo) throws Exception {

		int completeCount = approvalMapper.approvalCompleteCount(empNo);
		
		return completeCount;
	}
	
	@Override
	public int approvalProceedingCount(int empNo) throws Exception {
		
		int proceedingCount = approvalMapper.approvalProceedingCount(empNo);
		
		return proceedingCount;
	}
	
	@Override
	public int approvalNewCount(int empNo) throws Exception {
		
		int newApprovalCount = approvalMapper.approvalNewCount(empNo);
		
		return newApprovalCount;
	}
	
	@Override
	public ArrayList<Approval> mainDraftList(int empNo) throws Exception {

		ArrayList<Approval> draftList = approvalMapper.mainDraftList(empNo);
		
		return draftList;
	}
	
	@Override
	public ArrayList<Approval> mainAppList(int empNo) throws Exception {
		
		ArrayList<Approval> appList = approvalMapper.mainAppList(empNo);
		
		return appList;
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
	public int insertLoa(ApprovalLoa loa) throws Exception {
		
		int result = approvalMapper.insertLoa(loa);
		
		if(result < 0) {
			throw new Exception("품의서 등록에 실패하였습니다.");
		}
		
		return result;
		
	}

	@Override
	public int insertExpenditure(ApprovalExpenditure appEx) throws Exception {
		
		int result = approvalMapper.insertExpenditure(appEx);
		
		if(result < 0) {
			throw new Exception("지출결의서 등록에 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public int insertMminutes(ApprovalMMinutes appMm) throws Exception {
		
		int result = approvalMapper.insertMminutes(appMm);
		
		if(result < 0) {
			throw new Exception("회의록 등록에  실패하였습니다.");
		}
		
		return result;
		
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

	@Override
	public int appListCount(int emp_no) throws Exception {

		return approvalMapper.appListCount(emp_no);
	}

	@Override
	public ArrayList<Approval> selectAppList(int emp_no, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Approval> appList = approvalMapper.selectAppList(emp_no, rowBounds);
		
		if(appList.isEmpty()) {
			new Exception("결재함 조회에 실패하였습니다.");
		}
		
		return appList;
	}

	@Override
	public int searchAppListCount(Map<String, Object> map) throws Exception {
		
		return approvalMapper.searchAppListCount(map);
	}

	@Override
	public ArrayList<Approval> searchAppList(Map<String, Object> map, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Approval> appList = approvalMapper.searchAppList(map, rowBounds);
		
		if(appList.isEmpty()) {
			new Exception("검색에 실패하였습니다.");
		}
		
		return appList;
	}

	@Override
	public void updateAppLineLevelOneFirstApprover(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateAppLineLevelOneFirstApprover(map);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateAppLevelOneFirstApprover(int arppvoalNo) throws Exception {
		
		int result = approvalMapper.updateAppLevelOneFirstApprover(arppvoalNo);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
	}

	@Override
	public void updateAppLineLevelTwoFirstApprover(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateAppLineLevelTwoFirstApprover(map);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateAppLevelTwoFirstApprover(int arppvoalNo) throws Exception {
		
		int result = approvalMapper.updateAppLevelTwoFirstApprover(arppvoalNo);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateAppLineLevelTwoFinalApprover(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateAppLineLevelTwoFinalApprover(map);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateAppLevelTwoFinalApprover(int arppvoalNo) throws Exception {
		
		int result = approvalMapper.updateAppLevelTwoFinalApprover(arppvoalNo);
		
		if(result < 0) {
			new Exception("결재 승인에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateRejectLineFirstApprover(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateRejectLineFirstApprover(map);
		
		if(result < 0) {
			new Exception("결재 반려에 실패하였습니다.");
		}
	}

	@Override
	public void updateRejectFirstApprover(int arppvoalNo) throws Exception {
		
		int result = approvalMapper.updateRejectFirstApprover(arppvoalNo);
		
		if(result < 0) {
			new Exception("결재 반려에 실패하였습니다.");
		}
	}

	@Override
	public void updateRejectLineFinalApprover(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateRejectLineFinalApprover(map);
		
		if(result < 0) {
			new Exception("결재 반려에 실패하였습니다.");
		}
	}

	@Override
	public void updateRejectFinalApprover(int arppvoalNo) throws Exception {
		
		int result = approvalMapper.updateRejectFinalApprover(arppvoalNo);
		
		if(result < 0) {
			new Exception("결재 반려에 실패하였습니다.");
		}
		
	}

	@Override
	public ApprovalLoa selectUpdateLoa(int approvalNo) throws Exception {
		
		ApprovalLoa loa = approvalMapper.selectApprovalLoa(approvalNo);
		
		if(loa == null) {
			new Exception("수정할 품의서를 조회하는데 실패하였습니다.");
		}
		
		return loa;
	}

	@Override
	public void updateApproval(Approval app) throws Exception {
		
		int result = approvalMapper.updateApproval(app);
		
		if(result < 0) {
			new Exception("결재 문서 업데이트에 실패하였습니다.");
		}
		
	}

	@Override
	public void updateApprovalLineLevel(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.updateApprovalLineLevel(map);
		
		if(result < 0) {
			new Exception("결재선 업데이트에 실패하였습니다.");
		}
		
	}
	/*
	@Override
	public void updateApprovalLine(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}*/

	@Override
	public void updateLetterOfApproval(ApprovalLoa loa) throws Exception {
		
		int result = approvalMapper.updateLetterOfApproval(loa);
		
		if(result < 0) {
			new Exception("품의서 업데이트에 실패하였습니다.");
		}
	}

	@Override
	public ApprovalExpenditure selectUpdateAppEx(int approvalNo) throws Exception {

		ApprovalExpenditure appEx = approvalMapper.selectApprovalExpenditure(approvalNo);
		
		if(appEx == null) {
			new Exception("수정할 지출결의서 조회에 실패하였습니다.");
		}
		
		return appEx;
	}

	@Override
	public void updateExpenditure(ApprovalExpenditure appEx) throws Exception {
		
		int result = approvalMapper.updateExpenditure(appEx);
		
		if(result < 0) {
			new Exception("지출 결재서 업데이트에 실패하였습니다.");
		}
		
	}

	@Override
	public ApprovalMMinutes selectUpdateAppMm(int approvalNo) throws Exception {
		
		ApprovalMMinutes appMm = approvalMapper.selectApprovaltheMinutesOfAMeeting(approvalNo);
		
		if(appMm == null) {
			new Exception("수정할 회의록 조회에 실패하였습니다.");
		}
		
		return appMm;
	}

	@Override
	public void updateTheMinutesOfAMeeting(ApprovalMMinutes appMm) throws Exception {
		
		int result = approvalMapper.updateTheMinutesOfAMeeting(appMm);
		
		if(result < 0) {
			new Exception("회의록 업데이트에 실패하였습니다.");
		}
		
	}

	@Override
	public void deleteApproval(int approavalNo) throws Exception {
		
		int result = approvalMapper.deleteApproval(approavalNo);
		
		if(result < 0) {
			new Exception("기안서 삭제에 실패하였습니다.");
		}
	}

	@Override
	public void deleteApprovalLine(int approvalNo) throws Exception {
		
		int result = approvalMapper.deleteApprovalLine(approvalNo);
		
		if(result < 0) {
			new Exception("기안서 삭제에 실패하였습니다.");
		}
		
	}

	@Override
	public void deleteDocument(Map<String, Object> map) throws Exception {
		
		int result = approvalMapper.deleteDocument(map);
		
		if(result < 0) {
			new Exception("기안서 삭제에 실패하였습니다.");
		}
		
	}

	@Override
	public int draftWaitingListCount(int emp_no) throws Exception {
		
		return  approvalMapper.draftWaitingListCount(emp_no);
	}

	@Override
	public ArrayList<Approval> selectDraftWaitingList(int emp_no, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Approval> draftList = approvalMapper.selectDraftWaitingList(emp_no, rowBounds);
				
		return draftList;
	}





}
