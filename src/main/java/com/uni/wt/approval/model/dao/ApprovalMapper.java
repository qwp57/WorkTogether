package com.uni.wt.approval.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalExpenditure;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.approval.model.dto.ApprovalMMinutes;
import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface ApprovalMapper {

	ArrayList<Approval> mainApprovalWaitingList(int empNo);
	
	ArrayList<Department> selectDeptList();

	ArrayList<Employee> selectEmpList();

	int approvalWaitCount(int empNo);
	
	int approvalCompleteCount(int empNo);
	
	int approvalProceedingCount(int empNo);
	
	int approvalNewCount(int empNo);
	
	ArrayList<Approval> mainDraftList(int empNo);
	
	ArrayList<Approval> mainAppList(int empNo);
	
	int insertApproval(Approval app);

	int insertApprovalLine1(ApprovalLine appL);

	int insertApprovalLine2(ApprovalLine appL);

	int insertLoa(ApprovalLoa loa);

	int insertExpenditure(ApprovalExpenditure appEx);

	int insertMminutes(ApprovalMMinutes appMm);

	int draftListCount(int emp_no);

	ArrayList<Approval> selectDraftList(int emp_no, RowBounds rowBounds);

	int searchListCount(Map<String, Object> map);

	ArrayList<Approval> searchDraftList(Map<String, Object> map, RowBounds rowBounds);

	Approval selectApproval(int approvalNo);

	ApprovalLine selectApprovalLine(int approvalNo);

	ApprovalLoa selectApprovalLoa(int approvalNo);

	ApprovalExpenditure selectApprovalExpenditure(int approvalNo);

	ApprovalMMinutes selectApprovaltheMinutesOfAMeeting(int approvalNo);

	int appListCount(int emp_no);

	ArrayList<Approval> selectAppList(int emp_no, RowBounds rowBounds);

	int searchAppListCount(Map<String, Object> map);

	ArrayList<Approval> searchAppList(Map<String, Object> map, RowBounds rowBounds);

	int updateAppLineLevelOneFirstApprover(Map<String, Object> map);

	int updateAppLevelOneFirstApprover(int arppvoalNo);

	int updateAppLineLevelTwoFirstApprover(Map<String, Object> map);

	int updateAppLevelTwoFirstApprover(int arppvoalNo);

	int updateAppLineLevelTwoFinalApprover(Map<String, Object> map);

	int updateAppLevelTwoFinalApprover(int arppvoalNo);

	int updateRejectLineFirstApprover(Map<String, Object> map);

	int updateRejectFirstApprover(int arppvoalNo);

	int updateRejectLineFinalApprover(Map<String, Object> map);

	int updateRejectFinalApprover(int arppvoalNo);

	int updateApproval(Approval app);

	int updateApprovalLineLevel(Map<String, Object> map);

	int updateLetterOfApproval(ApprovalLoa loa);

	int updateExpenditure(ApprovalExpenditure appEx);

	int updateTheMinutesOfAMeeting(ApprovalMMinutes appMm);

	int deleteApproval(int approavalNo);

	int deleteApprovalLine(int approvalNo);

	int deleteDocument(Map<String, Object> map);

	int draftWaitingListCount(int emp_no);

	ArrayList<Approval> selectDraftWaitingList(int emp_no, RowBounds rowBounds);


}
