package com.uni.wt.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalExpenditure;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.approval.model.dto.ApprovalMMinutes;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

public interface ApprovalService {
	
	ArrayList<Department> selectDeptList() throws Exception;

	ArrayList<Employee> selectEmpList() throws Exception;

	void insertApproval(Approval app) throws Exception;
	
	void insertApprovalLine1(ApprovalLine appL) throws Exception;

	void insertApprovalLine2(ApprovalLine appL) throws Exception;
	
	void insertLoa(ApprovalLoa loa) throws Exception;

	void insertExpenditure(ApprovalExpenditure appEx) throws Exception;

	void insertMminutes(ApprovalMMinutes appMm) throws Exception;

	int draftListCount(int emp_no) throws Exception;

	ArrayList<Approval> selectDraftList(int emp_no, PageInfo pi) throws Exception;

	int searchListCount(Map<String, Object> map) throws Exception;

	ArrayList<Approval> searchDraftList(Map<String, Object> map, PageInfo pi) throws Exception;

	Approval selectApproval(int approvalNo) throws Exception;

	ApprovalLine selectApprovalLine(int approvalNo) throws Exception;

	ApprovalLoa selectApprovalLoa(int approvalNo) throws Exception;

	ApprovalExpenditure selectApprovalExpenditure(int approvalNo) throws Exception;

	ApprovalMMinutes selectApprovaltheMinutesOfAMeeting(int approvalNo) throws Exception;

	int appListCount(int emp_no) throws Exception;

	ArrayList<Approval> selectAppList(int emp_no, PageInfo pi) throws Exception;

	int searchAppListCount(Map<String, Object> map) throws Exception;

	ArrayList<Approval> searchAppList(Map<String, Object> map, PageInfo pi) throws Exception;
	
	//결재하기
	void updateAppLineLevelOneFirstApprover(Map<String, Object> map) throws Exception;

	void updateAppLevelOneFirstApprover(int arppvoalNo) throws Exception;

	void updateAppLineLevelTwoFirstApprover(Map<String, Object> map) throws Exception;

	void updateAppLevelTwoFirstApprover(int arppvoalNo) throws Exception;

	void updateAppLineLevelTwoFinalApprover(Map<String, Object> map) throws Exception;

	void updateAppLevelTwoFinalApprover(int arppvoalNo) throws Exception;

	void updateRejectLineFirstApprover(Map<String, Object> map) throws Exception;

	void updateRejectFirstApprover(int arppvoalNo) throws Exception;

	void updateRejectLineFinalApprover(Map<String, Object> map) throws Exception;

	void updateRejectFinalApprover(int arppvoalNo) throws Exception;
	
	//업데이트
	ApprovalLoa selectUpdateLoa(int parseInt) throws Exception;

	void updateApproval(Approval app) throws Exception;

	void updateApprovalLineLevel(Map<String, Object> map) throws Exception;

	//void updateApprovalLine(Map<String, Object> map) throws Exception;

	void updateLetterOfApproval(ApprovalLoa loa) throws Exception;

	ApprovalExpenditure selectUpdateAppEx(int approvalNo) throws Exception;





}
