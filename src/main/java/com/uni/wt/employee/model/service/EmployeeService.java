package com.uni.wt.employee.model.service;

import com.uni.wt.employee.model.dto.Employee;

public interface EmployeeService {

	int idCheck(String userId) throws Exception;

	void insertEmp(Employee emp) throws Exception;

	Employee loginEmp(Employee emp) throws Exception;

}