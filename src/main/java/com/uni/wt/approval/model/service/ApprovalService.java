package com.uni.wt.approval.model.service;

import java.util.ArrayList;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.employee.model.dto.Employee;

public interface ApprovalService {

	ArrayList<Department> selectDeptList() throws Exception;

	ArrayList<Employee> selectEmpList() throws Exception;

}
