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

	ArrayList<Department> selectDeptList();

	ArrayList<Employee> selectEmpList();

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

	Approval selectDraftApproval(int approvalNo);

	ApprovalLine selectDraftApprovalLine(int approvalNo);

	ApprovalLoa selectApprovalLoa(int approvalNo);

	ApprovalExpenditure selectApprovalExpenditure(int approvalNo);

	ApprovalMMinutes selectApprovaltheMinutesOfAMeeting(int approvalNo);

	int appListCount(int emp_no);

	ArrayList<Approval> selectAppList(int emp_no, RowBounds rowBounds);

	int searchAppListCount(Map<String, Object> map);

	ArrayList<Approval> searchAppList(Map<String, Object> map, RowBounds rowBounds);

}
