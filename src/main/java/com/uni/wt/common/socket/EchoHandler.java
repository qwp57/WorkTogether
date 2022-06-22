package com.uni.wt.common.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class EchoHandler extends TextWebSocketHandler{
	//로그인한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	
	
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("[WebSocket] :Socket 연결");
		log.info("sessions.add(session) : {}",session );
		sessions.add(session);
		log.info("[sessions] : {}", sessions.toString());
		
		 Employee emp = getEmp(session);
		 users.put(String.valueOf(emp.getEmp_no()), session);
		log.info("[users] : {}", users.toString());

	}
	private Employee getEmp(WebSocketSession session) {
		Map<String, Object> sessionVal =  session.getAttributes();
		Employee emp =(Employee)sessionVal.get("loginEmp");
		log.info("session.getAttributes() : "+sessionVal.toString());
		log.info("emp : "+emp.toString());

		return emp;
		
	}
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("[WebSocket] : 메시지 전송 ");
		
		String msg = message.getPayload();
		
		log.info("msg : {}", msg);
		
		if(msg != null) {
			String[] msgs = msg.split(",");
			log.info(msgs.toString());
			if(msgs != null && msgs.length >= 2) {
				String type = msgs[0];
				String receiver = msgs[1];
				
				String name = getEmp(session).getName();
				
				log.info("receiver : {}", receiver);
				log.info("users : {}" , users);
				log.info("users.get(최부장) : {}",users.get(receiver) );
				
				WebSocketSession receiverSession = users.get(receiver);
				
				if(receiverSession != null) {
					TextMessage txtmsg = new TextMessage(name+"님이 "+receiver+"님에게 업무를 요청했습니다.");
					receiverSession.sendMessage(txtmsg);
				}else {
					TextMessage txtmsg = new TextMessage(name + "님이"+receiver+"님에게 업무를 요청했습니다 "); 
					session.sendMessage(txtmsg);
				}
				
				
			}
		}
		
		
	}
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("[WebSocket] : 연결 해제 ");
		sessions.remove(session);
		users.remove(getEmp(session).getName(), session);
	}
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	
	public Map<String, WebSocketSession> getUsers() {
		return users;
	}

	

}

