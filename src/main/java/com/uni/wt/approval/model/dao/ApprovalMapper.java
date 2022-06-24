package com.uni.wt.approval.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface ApprovalMapper {

	ArrayList<Department> selectDeptList();

	ArrayList<Employee> selectEmpList();

	int insertApproval(Approval app);

	int insertApprovalLine1(ApprovalLine appL);

	int insertApprovalLine2(ApprovalLine appL);

	int insertLoa(ApprovalLoa loa);
}
