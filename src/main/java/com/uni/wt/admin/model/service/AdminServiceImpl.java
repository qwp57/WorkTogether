package com.uni.wt.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.admin.model.dao.AdminMapper;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int selectListCount() {
		
		return adminMapper.selectListCount();
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return adminMapper.selectList(rowBounds);
	}

	@Override
	public int adminApproval(int empNo) {

		return adminMapper.adminApproval(empNo);
	}

	@Override
	public int adminReject(Map<String, Object> map) throws Exception {
		
		//회원 status r로 바꾸기
		//Object를 int로 형 변환하여 mapper로 보낸다.
		//오브젝트를 (String)으로 바로 형 변환하여 사용하면 오류가 발생한다.
		//Object 타입을 String.valueOf를 사용하여 String 형으로 바꿔주고, 바꿔준 것을 다시 int형으로 바꿔준다.
		int empNo = Integer.parseInt(String.valueOf(map.get("empNo"))); 
		int result1 = adminMapper.adminReject(empNo);
		
		int result2 = 0;
		if(result1 > 0) {
			result2 = adminMapper.rejectReason(map);
		}else {
			throw new Exception("가입 거부에 실패하였습니다.");
		}
		
		return result2;
	}



	

}
