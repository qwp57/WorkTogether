package com.uni.wt.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface ApprovalMapper {

	ArrayList<Department> selectDeptList();

	ArrayList<Employee> selectEmpList();

}
