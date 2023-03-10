package com.uni.wt.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.dto.EmployeeSearchCondition;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

public interface AdminService {

	int selectListCount();
	
	ArrayList<Employee> selectList(PageInfo pi) throws Exception;

	int adminApproval(int empNo);

	int adminReject(Map<String, Object> map) throws Exception;

	int approvalSortListCount(String sortCondition) throws Exception;
	
	ArrayList<Employee> approvalSortList(String sortCondition, PageInfo pi);
	
	ArrayList<Department> selectUpperList() throws Exception;

	int addDeptList(Map<String, Object> map);

	int deleteDeptList(int deptCode);

	int updateDeptList(Map<String, Object> map);

	int empListCount() throws Exception;

	ArrayList<Employee> selectEmpList(PageInfo pi);

	String addUpperDept(String dept_code);
	
	void addEmployee(Employee emp) throws Exception;

	Employee updateView(int eno) throws Exception;

	void updateEmployee(Employee emp) throws Exception;

	void updateEmployeeResignation(Map<String, Object> map) throws Exception;

	int searchListCount(EmployeeSearchCondition sc) throws Exception;

	ArrayList<Employee> searchEmpList(EmployeeSearchCondition sc, PageInfo pi) throws Exception;

	ArrayList<Department> selectDeptList() throws Exception;

	int deptCount() throws Exception;
	
	ArrayList<Employee> organizationEmpList() throws Exception;

	Employee empModal(int emp_no) throws Exception;

	ArrayList<Employee> DeptEmpList(String deptName) throws Exception;

	ArrayList<Department> selectDeptEmpList(Map<String, Object> map) throws Exception;

}
