package com.uni.wt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {

	@RequestMapping("/allProject")
	public String allProject() {
		return "project/allProject";
	}
	
	@RequestMapping("/detailPj.do")
	public String detailPj() {
		return "project/detailPj";
	}
}
