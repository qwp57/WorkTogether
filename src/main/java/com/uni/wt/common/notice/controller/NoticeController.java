package com.uni.wt.common.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.wt.common.notice.dto.Notice;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.employee.model.dto.Employee;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ResponseBody
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(int notice_no, HttpServletRequest request) throws Exception {
		log.info("삭제할 알림 번호 : {}", notice_no);
		
		String result  = noticeService.deleteNotice(notice_no, request);
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("plusNoticeList.do")
	public String plusNoticeList(HttpServletRequest request, int notice_no) throws Exception {
		
		String result = noticeService.plusNoticelist(request, notice_no);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteAllNotice.do")
	public String deleteAllNotice(HttpServletRequest request) throws Exception {
		int emp_no = ((Employee)request.getSession().getAttribute("loginEmp")).getEmp_no();
		String result = noticeService.deleteAllNotice(emp_no);
		ArrayList<Notice> list= (ArrayList<Notice>) request.getSession().getAttribute("noticeList");
		list.clear();
		request.getSession().setAttribute("noticeList", list);
		request.getSession().setAttribute("unreadNotice", list.size());
		return result;
	}

}
