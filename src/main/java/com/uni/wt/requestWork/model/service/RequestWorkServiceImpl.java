package com.uni.wt.requestWork.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dao.RequestWorkMapper;
import com.uni.wt.requestWork.model.dto.RequestWork;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Primary
@Transactional(rollbackFor = Exception.class)
public class RequestWorkServiceImpl implements RequestService{
	private Map<String, Object> paramMap = new HashMap<String, Object>();
	
	@Autowired
	private RequestWorkMapper rwMapper;
	
	@Override
	public ArrayList<Object> selectDeptList() throws Exception {
		
		return rwMapper.selectDeptList();
	}

	@Override
	public ArrayList<Employee> getDeptMember(int dept_code, int emp_no) throws Exception {
		paramMap.put("dept_code", dept_code);
		paramMap.put("emp_no", emp_no);
		
		ArrayList<Employee> list = rwMapper.getDeptMember(paramMap);
		paramMap.clear();
		return list;
	}

	@Override
	public ArrayList<Project> selectProjectList(int emp_no) throws Exception {
		
		return rwMapper.selectProjectList(emp_no);
	}

	@Override
	public int insertRequestWork(RequestWork rw) throws Exception {
		
		int rwSeq = rwMapper.getRWSeq();
		
		rw.setRw_no(rwSeq);
		int result = rwMapper.insertRequestWork(rw);
		
		if(result > 0) {
			
			return rwSeq;
		}else {
			rw = null;
			return result;
		}
		
	}

	@Override
	public Map<String, Object> selectCountRw(int emp_no) throws Exception {
		
		return rwMapper.selectCountRw(emp_no);
	}

	@Override
	public int getListCount(int emp_no, String boardType) throws Exception {
		paramMap.put("boardType", boardType);
		paramMap.put("emp_no", emp_no);
		
		int result = rwMapper.getListCount(paramMap);
		paramMap.clear();
		
		
		return result;
	}

	@Override
	public ArrayList<RequestWork> selectRQList(int emp_no, PageInfo pi, String sortVal) throws Exception {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		paramMap.put("sortVal", sortVal);
		paramMap.put("emp_no", emp_no);
		ArrayList<RequestWork> list = rwMapper.selectRQList(paramMap, rwB);
		paramMap.clear();
		
		return list;
	}

	@Override
	public ArrayList<RequestWork> selectRSList(int emp_no, PageInfo pi, String sortVal) throws Exception {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		paramMap.put("sortVal", sortVal);
		paramMap.put("emp_no", emp_no);
		ArrayList<RequestWork> list = rwMapper.selectRSList(paramMap, rwB);
		paramMap.clear();
		
		return  list;
	}

	@Override
	public RequestWork selectRWDetail(String rw_no) throws Exception {
		
		RequestWork detail = rwMapper.selectRWDetail(rw_no);
		
		if(detail == null) {
			throw new Exception("업무요청 상세조회에 실패했습니다");
		}
		
		return detail;
	}

	@Override
	public void cancleRW(RequestWork rw) throws Exception {
		
		int result = rwMapper.updateRW(rw);
		if(result <= 0) {
			throw new Exception("업무 요청 취소/거절에 실패했습니다.");
		}
		
		
	}

	@Override
	public void updateRW(RequestWork rw) throws Exception {
		
		int result = rwMapper.updateRW(rw);
		if(result <= 0) {
			throw new Exception("요청된 업무의 상태 변경에 실패했습니다.");
		}
		
	}

	@Override
	public void deleteRW(int rw_no) throws Exception {
		int result = rwMapper.deleteRW(rw_no);
		if(result <= 0) {
			throw new Exception("업무 요청의 삭제를 실패했습니다.");
		}
		
		
	}

	@Override
	public int getCompleteListCount(int emp_no, String type, SearchDto sd) throws Exception {
		paramMap.put("emp_no", emp_no);
		paramMap.put("type", type);
		paramMap.put("sd", sd);
		int result = rwMapper.getCompleteListCount(paramMap);
		paramMap.clear();
		
		return result;
	}

	@Override
	public ArrayList<RequestWork> completeRequest(int emp_no, String type, SearchDto sd, PageInfo pi, String sort) throws Exception {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
		
		paramMap.put("emp_no", emp_no);
		paramMap.put("type", type);
		paramMap.put("sd", sd);
		paramMap.put("sort", sort);
		ArrayList<RequestWork> list = rwMapper.completeRequest(paramMap, rwB);
		paramMap.clear();
		
		return list;
	}

}
