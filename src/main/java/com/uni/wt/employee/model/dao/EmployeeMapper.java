package com.uni.wt.employee.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface EmployeeMapper {

	public int idCheck(String userId);

	public int insertEmp(Employee emp);

	public Employee loginEmp(Employee emp);

	public ArrayList<Employee> selectSupvEmpList(Employee emp)throws Exception;

	public ArrayList<Map<String, String>> getDetpList()throws Exception;

	public ArrayList<Map<String, String>> getJobList()throws Exception;

	public int myProfileUpdate(Employee emp)throws Exception;

	public Employee selectUpdatedEmp(int emp_no)throws Exception;

	public String getUpperDeptCode(String dept_code)throws Exception;

}
