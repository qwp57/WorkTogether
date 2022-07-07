package com.uni.wt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.admin.model.dao.AdminMapper;
import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.admin.model.dto.EmployeeSearchCondition;
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
		
		return adminMapper.selectList(null, rowBounds);
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
			System.out.println("result2" + result2);
		}else {
			throw new Exception("가입 거부에 실패하였습니다.");
		}
		
		return result2;
	}

	@Override
	public ArrayList<Department> selectUpperList() throws Exception {
		
		return adminMapper.selectUpperList();
	}

	@Override
	public int deptCount() throws Exception {

		return adminMapper.deptCount();
	}
	
	@Override
	public int addDeptList(Map<String, Object> map) {
		
		int upperDeptCode = Integer.parseInt(String.valueOf(map.get("upperDeptCode"))); 
		
		int result = 0;
		if(upperDeptCode == 1) { //상위 부서가 없다는 뜻, 그냥 가장 최상위 부서에 속한 부서
			//부서 insert하기
			result = adminMapper.addDeptList(map);
		}else {
			//하위 부서 insert하기
			result = adminMapper.addUpperDeptList(map);
		}
				
		return result;
	}

	@Override
	public int deleteDeptList(int deptCode) {
		
		return adminMapper.deleteDeptList(deptCode);
	}

	@Override
	public int updateDeptList(Map<String, Object> map) {

		return adminMapper.updateDeptList(map);
	}

	@Override
	public int empListCount() throws Exception {
		
		return adminMapper.empListCount();
	}

	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return adminMapper.selectEmpList(null, rowBounds);
	}

	@Override
	public void addEmployee(Employee emp) throws Exception {
		
		int result = adminMapper.addEmployee(emp);
		
		if(result < 0) {
			throw new Exception("사원 추가에 실패하였습니다.");
		}

	}

	@Override
	public Employee updateView(int eno) throws Exception {
		
		return adminMapper.updateView(eno);
	}

	@Override
	public void updateEmployee(Employee emp) throws Exception {
		
		int result = adminMapper.updateEmployee(emp);
		
		if(result < 0) {
			throw new Exception("회원 정보 수정에 실패하였습니다.");
		}
	}

	@Override
	public void updateEmployeeResignation(Map<String, Object> map) throws Exception {
		
		int result = adminMapper.updateEmployeeResignation(map);
		
		if(result < 0) {
			throw new Exception("회원 정보 수정에 실패하였습니다.");
		}		
	}

	@Override
	public int searchListCount(EmployeeSearchCondition sc) throws Exception {
		
		return adminMapper.searchListCount(sc);
	}

	@Override
	public ArrayList<Employee> searchEmpList(EmployeeSearchCondition sc, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return adminMapper.searchEmpList(sc, rowBounds);
	}

	@Override
	public ArrayList<Department> selectDeptList() throws Exception {

		return adminMapper.selectDeptList();
	}

	@Override
	public ArrayList<Employee> organizationEmpList() throws Exception {
		
		return adminMapper.organizationEmpList();
	}

	@Override
	public Employee empModal(int emp_no) throws Exception {
		
		Employee emp = adminMapper.empModal(emp_no);
		
		if(emp == null) {
			throw new Exception("사원 정보 조회에 실패하였습니다.");
		}
		
		return emp;
	}

	@Override
	public ArrayList<Employee> DeptEmpList(String deptName) throws Exception {
		
		ArrayList<Employee> empList = adminMapper.DeptEmpList(deptName);
			
		if(empList.isEmpty()) {
			throw new Exception("부서 사원 정보 조회에 실패하였습니다.");
		}
		
		return empList;
	}

	@Override
	public ArrayList<Department> selectDeptEmpList(Map<String, Object> map) throws Exception {
		
		ArrayList<Department> deptEmpList = adminMapper.selectDeptEmpList(map);
		
		if(deptEmpList == null) {
			throw new Exception("부서 사원 정보 조회에 실패하였습니다.");
		}
		
		return deptEmpList;
	}


}
