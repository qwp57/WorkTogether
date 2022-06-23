package com.uni.wt.common.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
	
	@RequestMapping("deleteNotice.do")
	public String deleteNotice(String notice_no) {
		log.info("삭제할 알림 번호 : {}", notice_no);
		
		
		return "1";
	}

}
