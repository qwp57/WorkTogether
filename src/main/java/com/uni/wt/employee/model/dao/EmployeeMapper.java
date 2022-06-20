package com.uni.wt.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface EmployeeMapper {

	public int idCheck(String userId);

	public int insertEmp(Employee emp);

	public Employee loginEmp(Employee emp);

	public ArrayList<Employee> selectSupvEmpList(Employee emp)throws Exception;

}
