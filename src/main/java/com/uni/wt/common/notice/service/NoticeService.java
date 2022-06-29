package com.uni.wt.common.notice.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	public void insertNotice(Employee emp, int seqNo, String type, HttpServletRequest request) throws Exception {
		//로그인된 사원 정보, 글번호, 게시판타입
		
		Notice notice = null;//알림 insert해줄 Notice 객체 
		int result=0;// 등록이 됐는지 확인할 result 
		
		int nno = noticeMapper.getNoticeSeq();
		
		//타입이 RW이면 업무요청 글 알림 형식에 맞추는 에소드로 이동한다. 
		switch(type) {
		case "RW" :
			result = noticeMapper.insertNotice(insertRWNotice(emp, seqNo, type, nno));
			break;
		}
		
		//결과 확인
		if(result <= 0) {
			throw new Exception("알림 등록에 실패했습니다.");
		}
		
		//입력한 notice 정보 완전조회
		Notice noticeResult = noticeMapper.selectNotice(nno);
		
		//세션에 새 알림 저장 
		//plusNoticelist(request, noticeResult);
		
		
		////////웹소켓 전송
		websocketSend(emp, noticeResult);
		
	}



	private Notice insertRWNotice(Employee emp, int seqNo, String type, int nno)throws Exception {
		
		//글번호로 업무요청 글을 조회해온다. 
		RequestWork rw= rwMapper.selectRWDetailsimple(seqNo);
		
		int emp_no = Integer.parseInt(rw.getRes_member());//수신인
		String content = emp.getName()+"님이 업무를 요청했습니다";//알림메시지
		String contentDetail = rw.getTitle();
		String url = "/selectRWDetail_Notice.do?rno="+seqNo;//URL
		
		return new Notice(nno, emp_no, type, content, contentDetail,url);
		
	}
	
	private void websocketSend(Employee emp, Notice notice)throws Exception {
		Map<String, WebSocketSession> users = echoHandler.getUsers();
		
		String msg = notice.getNotice_no()+","+notice.getType()+","+notice.getContent()+","+
				notice.getContentDetail()+","+notice.getUrl()+","+notice.getCreate_date();
		
		for(WebSocketSession receiverSession : users.values()) {
			Map<String, Object> map = receiverSession.getAttributes();
			Employee e = (Employee)map.get("loginEmp");
			if(receiverSession != null) {
				if(e.getEmp_no() == notice.getEmp_no()) {
					log.info("e.getEmp_no : "+e.getEmp_no()+"....notice.getEmp_no() : "+notice.getEmp_no());
					TextMessage txtMsg = new TextMessage(msg);
					receiverSession.sendMessage(txtMsg);
				}
			}
			
			
		}
		
		
		
	}



	public ArrayList<Notice> selectNoticeList(String emp_no) throws Exception {
		
		return noticeMapper.selectNoticeList(emp_no);
		
		
	}



	public String plusNoticelist(HttpServletRequest request, int notice_no)throws Exception {
		ArrayList<Notice>list = (ArrayList<Notice>) request.getSession().getAttribute("noticeList");
		Notice n = noticeMapper.selectNotice(notice_no);
		list.add(n);
		
		request.getSession().setAttribute("noticeList", list);
		request.getSession().setAttribute("unreadNotice", list.size());
		
		if(n != null) {
			
			return "success";
		}else {
			return "fail";
		}
		
	}



	public String deleteNotice(int notice_no, HttpServletRequest request) throws Exception {
		
		Notice n = noticeMapper.selectNotice(notice_no);
		int result = noticeMapper.deleteNotice(notice_no);
		if(result > 0) {
		
			ArrayList<Notice>list = (ArrayList<Notice>) request.getSession().getAttribute("noticeList");
			if(list.size() == 1) {
				list.clear();
			}else {
				
				boolean b = list.remove(n);
				log.info("알림 리스트 삭제 결과 : {}", b);
			}
			
			log.info(list.toString());
			request.getSession().setAttribute("noticeList", list);
			request.getSession().setAttribute("unreadNotice", list.size());
			
			return "1";
		
		}else {
			return "2";
		}
		
		
	}



	public String deleteAllNotice(int emp_no) throws Exception {
		int result = noticeMapper.deleteAllNotice(emp_no);
		
		if(result > 0) {
			return "success";
		}
		
		return "fail";
	}

}
