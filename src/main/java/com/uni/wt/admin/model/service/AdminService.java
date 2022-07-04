package com.uni.wt.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.dto.EmployeeSearchCondition;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

public interface AdminService {

	int selectListCount();
	
	ArrayList<Employee> selectList(PageInfo pi);

	int adminApproval(int empNo);

	int adminReject(Map<String, Object> map) throws Exception;

	ArrayList<Department> selectUpperList() throws Exception;

	int addDeptList(Map<String, Object> map);

	int deleteDeptList(int deptCode);

	int updateDeptList(Map<String, Object> map);

	int empListCount() throws Exception;

	ArrayList<Employee> selectEmpList(PageInfo pi);

	void addEmployee(Employee emp) throws Exception;

	Employee updateView(int eno) throws Exception;

	void updateEmployee(Employee emp) throws Exception;

	void updateEmployeeResignation(Employee emp) throws Exception;

	int searchListCount(EmployeeSearchCondition sc) throws Exception;

	ArrayList<Employee> searchEmpList(EmployeeSearchCondition sc, PageInfo pi) throws Exception;

	ArrayList<Department> selectDeptList() throws Exception;

	ArrayList<Employee> organizationEmpList() throws Exception;



}
