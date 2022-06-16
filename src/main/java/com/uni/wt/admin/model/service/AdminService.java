package com.uni.wt.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

public interface AdminService {

	int selectListCount();

	ArrayList<Employee> selectList(PageInfo pi);

	int adminApproval(int empNo);

	int adminReject(Map<String, Object> map) throws Exception;

}
