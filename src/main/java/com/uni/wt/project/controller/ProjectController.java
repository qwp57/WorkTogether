package com.uni.wt.project.controller;

import com.google.gson.GsonBuilder;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.service.ProjectService;
import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.service.ProjectMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;
	@Autowired
	private ProjectMemberService projectMemberService;
	private Map<String, String> msgMap = new HashMap<String, String>();

	@RequestMapping("")
	public String allProject() {

		return "project/allProject";
	}
	@ResponseBody
	@RequestMapping(value = "selectAllProjcet", produces="application/json; charset=utf-8")
	public String selectAllProject(HttpSession session) throws Exception {
		ArrayList<Project> list = projectService.selectAllProject(((Employee)session.getAttribute("loginEmp")).getEmp_no());
		log.info("프로젝트 전체조회 : " + list.toString());
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
	}
	
	@RequestMapping("/detailPj.do")
	public String detailPj(@RequestParam("pj_no") int pj_no, Model m) throws Exception {


		Project pj = projectService.selectOneProject(pj_no);
		log.info("프로젝트 상세보기 pj : " + pj);
		m.addAttribute("pj", pj);

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
	@RequestMapping("/enrollProject.do")
	public String enrollProject () {
		return "project/pjForm";
	}
	@RequestMapping("/storedPj.do")
	public String storedPj () {
		return "project/storedPj";
	}
	@RequestMapping("/selectTag.do")
	public String selectTag() {
		return "project/selectTag";
	}
	@RequestMapping("/chatinvite.do")
	public String chatinvite() {
		return "chat/chatinvite";
	}
	@RequestMapping("/chatRoom.do")
	public String chatRoom() {
		return "chat/chatroom";
	}

	@RequestMapping("/insertPj.do")
	public String inseretProject(@Valid Project project, RedirectAttributes redirect, ProjectMember pjm, HttpSession session) throws Exception {
		log.info(project.toString());

		int pj_no = projectService.nextPjNo();
		project.setPj_no(pj_no);
		projectService.insertProject(project);

		pjm.setEmp_no(((Employee)session.getAttribute("loginEmp")).getEmp_no());
		pjm.setPj_no(pj_no);
		projectMemberService.insertProjectMember(pjm);
		msgMap.put("msg", "프로젝트 생성 완료.");
		redirect.addFlashAttribute("msg", msgMap);

		return "redirect:/allProject.do";
	}



}
