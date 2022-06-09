package com.uni.wt.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {

	//단순 화면 전환
	@RequestMapping("adminApproval.do")
	public String adminPageMain() {
		return "admin/adminApprovalView";
	}
}
