package com.uni.wt.common.notice.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;

import com.uni.wt.common.notice.dao.NoticeMapper;
import com.uni.wt.common.notice.dto.Notice;
import com.uni.wt.common.socket.EchoHandler;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.requestWork.model.dao.RequestWorkMapper;
import com.uni.wt.requestWork.model.dto.RequestWork;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Primary
@Transactional(rollbackFor = Exception.class)
public class NoticeService {
		
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private RequestWorkMapper rwMapper;

	@Autowired
	private EchoHandler echoHandler;

	public void insertNotice(Employee emp, int seqNo, String type) throws Exception {
		//로그인된 사원 정보, 글번호, 게시판타입
		
		Notice notice = null;//알림 insert해줄 Notice 객체 
		int result=0;// 등록이 됐는지 확인할 result 
		
		//타입이 RW이면 업무요청 글 알림 형식에 맞추는 에소드로 이동한다. 
		switch(type) {
		case "RW" :
			notice= insertRWNotice(emp, seqNo, type);
			result = noticeMapper.insertNotice(notice);
			break;
		}
		
		if(result <= 0) {
			throw new Exception("알림 등록에 실패했습니다.");
		}
		
		////////웹소켓 전송
		websocketSend(emp, notice);
		
	}



	private Notice insertRWNotice(Employee emp, int seqNo, String type)throws Exception {
		
		//글번호로 업무요청 글을 조회해온다. 
		RequestWork rw= rwMapper.selectRWDetail(seqNo);
		
		int emp_no = Integer.parseInt(rw.getRes_member());//수신인
		String content = emp.getName()+"님이 업무를 요청했습니다.\n("+rw.getTitle()+")";//알림메시지
		String url = "/requestWork/selectDetail?rno="+seqNo;//URL
		
		return new Notice(emp_no, type, content, url);
		
	}
	
	private void websocketSend(Employee emp, Notice notice)throws Exception {
		Map<String, WebSocketSession> users = echoHandler.getUsers();
		
		for(WebSocketSession receiverSession : users.values()) {
			Map<String, Object> map = receiverSession.getAttributes();
			Employee e = (Employee)map.get("loginEmp");
			if(receiverSession != null) {
				if(e.getEmp_no() == notice.getEmp_no()) {
					TextMessage txtMsg = new TextMessage(notice.getContent());
					receiverSession.sendMessage(txtMsg);
				}
			}
			
			
		}
		
		
		
	}

}
