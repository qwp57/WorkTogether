package com.uni.wt.employee.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.employee.model.dto.Employee;

public interface EmployeeService {

	int idCheck(String userId) throws Exception;

	void insertEmp(Employee emp) throws Exception;

	Employee loginEmp(Employee emp) throws Exception;

	ArrayList<Employee> selectSupvEmpList(Employee emp)throws Exception;

	ArrayList<Map<String, String>> getDetpList()throws Exception;

	ArrayList<Map<String, String>> getJobList()throws Exception;

	Employee myProfileUpdate(Employee emp)throws Exception;

	String getUpperDeptCode(String dept_code)throws Exception;

	ArrayList<Map<String, Object>> getStacts(int month)throws Exception;

}
