package com.uni.wt.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.uni.wt.employee.model.dto.Employee;

@Mapper
public interface AdminMapper {

	int selectListCount();

	ArrayList<Employee> selectList(RowBounds rowBounds);

	int adminApproval(int empNo);

	int adminReject(int empNo);

	int rejectReason(Map<String, Object> map);
	
}
