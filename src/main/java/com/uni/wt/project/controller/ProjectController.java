package com.uni.wt.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {

	@RequestMapping("/allProject.do")
	public String allProject() {
		return "project/allProject";
	}
	
	@RequestMapping("/detailPj.do")
	public String detailPj() {
		return "project/detailPj";
	}
	@RequestMapping("/detailCalendar.do")
	public String detailCalendar() {
		return "project/detailCalendar";
	}
	@RequestMapping("/drivePj.do")
	public String drivePj() {
		return "project/drivePj";
	}
	@RequestMapping("/mentionedBoard.do")
	public String mentionedBoard () {
		return "project/mentionedBoard";
	}
	@RequestMapping("/myBoard.do")
	public String myBoard () {
		return "project/myBoard";
	}
	@RequestMapping("/allCalendar.do")
	public String allCalendar () {
		return "project/allCalendar";
	}
	
}
