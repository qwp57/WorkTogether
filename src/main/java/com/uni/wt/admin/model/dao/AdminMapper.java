package com.uni.wt.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.dto.EmployeeSearchCondition;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface AdminMapper {

	int selectListCount();

	ArrayList<Employee> selectList(Object object, RowBounds rowBounds);
	
	int adminApproval(int empNo);

	int adminReject(int empNo);

	int rejectReason(Map<String, Object> map);

	int approvalSortListCount(String sortCondition);
	
	ArrayList<Employee> approvalSortList(String sortCondition, RowBounds rowBounds);
	
	ArrayList<Department> selectUpperList();

	int deptCount();
	
	int addDeptList(Map<String, Object> map);

	int addUpperDeptList(Map<String, Object> map);

	int deleteDeptList(int deptCode);

	int updateDeptList(Map<String, Object> map);

	int empListCount();

	ArrayList<Employee> selectEmpList(Object object, RowBounds rowBounds);

	String addUpperDept(String dept_code);
	
	int addEmployee(Employee emp);

	Employee updateView(int eno);

	int updateEmployee(Employee emp);

	int updateEmployeeResignation(Map<String, Object> map);

	int searchListCount(EmployeeSearchCondition sc);

	ArrayList<Employee> searchEmpList(EmployeeSearchCondition sc, RowBounds rowBounds);

	ArrayList<Department> selectDeptList();

	ArrayList<Employee> organizationEmpList();

	Employee empModal(int emp_no);

	ArrayList<Employee> DeptEmpList(String deptName);

	ArrayList<Department> selectDeptEmpList(Map<String, Object> map);


}
