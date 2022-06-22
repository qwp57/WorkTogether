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

	ArrayList<Employee> selectList(RowBounds rowBounds);
	
	int adminApproval(int empNo);

	int adminReject(int empNo);

	int rejectReason(Map<String, Object> map);

	ArrayList<Department> selectUpperList();

	int addDeptList(Map<String, Object> map);

	int addUpperDeptList(Map<String, Object> map);

	int deleteDeptList(int deptCode);

	int updateDeptList(Map<String, Object> map);

	int empListCount();

	ArrayList<Employee> selectEmpList(PageInfo pi);

	int addEmployee(Employee emp);

	Employee updateView(int eno);

	int updateEmployee(Employee emp);

	int updateEmployeeResignation(Employee emp);

	int searchListCount(EmployeeSearchCondition sc);

	ArrayList<Employee> searchEmpList(Map<String, Object> map);

}
