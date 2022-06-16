package com.uni.wt.project.controller;

import com.google.gson.Gson;
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	@RequestMapping(value = "/selectAllProject", produces="application/json; charset=utf-8")
	public String selectAllProject(HttpSession session) throws Exception {
		int loginEmp = ((Employee)session.getAttribute("loginEmp")).getEmp_no();
		ArrayList<Project> myProjects = projectService.selectMyProject(loginEmp);
		ArrayList<Project> bookmarkProjects = projectService.selectMyBookmarkProject(loginEmp);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		log.info("bookmarkProjects : " + bookmarkProjects);
		ArrayList myAllProjects = new ArrayList();
		myAllProjects.add(myProjects);
		myAllProjects.add(bookmarkProjects);
		return gson.toJson(myAllProjects);
	}
	@ResponseBody
	@RequestMapping(value = "/selectProjectColor", produces="application/json; charset=utf-8")
	public String selectProjectColor(HttpSession session) throws Exception {
		int loginEmp = ((Employee)session.getAttribute("loginEmp")).getEmp_no();
		ArrayList<ProjectMember> list = projectMemberService.selectProjectColor(loginEmp);
		return new GsonBuilder().create().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "/setProjectColor.do", produces="application/json; charset=utf-8")
	public String setProjectColor(HttpSession session, @RequestParam("selectedProjects[]") List<String> list, @RequestParam("selectedColor") String color) throws Exception {
		int loginEmp = ((Employee)session.getAttribute("loginEmp")).getEmp_no();

		log.info("선택된 프로젝트 : "+list.toString());
		for (int i = 0; i < list.size(); i++){
			ProjectMember pjm = new ProjectMember();
			pjm.setEmp_no(loginEmp);
			pjm.setPj_color(color);
			pjm.setPj_no(Integer.parseInt(list.get(i)));
			projectMemberService.setProjectColor(pjm);
		}
		log.info("색상 : " + color);
		return "색상 설정 완료";
	}
	@ResponseBody
	@RequestMapping(value = "/projectMemberCount.do", produces="application/json; charset=utf-8")
	public String projectMemberCount(@RequestParam("pj_no") int pj_no) throws Exception {

		log.info("pj_no : "+pj_no);

		return "8";
	}

	@ResponseBody
	@RequestMapping(value = "/insertBookmark.do", produces = "application/text;charset=utf8")
	public String insertBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

		pjm.setPj_no(pj_no);
		pjm.setEmp_no(((Employee)session.getAttribute("loginEmp")).getEmp_no());
		projectMemberService.insertBookmark(pjm);

		return "즐겨찾기 추가";
	}
	@ResponseBody
	@RequestMapping(value = "/removeBookmark.do", produces = "application/text;charset=utf8")
	public String removeBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

		pjm.setPj_no(pj_no);
		pjm.setEmp_no(((Employee)session.getAttribute("loginEmp")).getEmp_no());
		projectMemberService.removeBookmark(pjm);

		return "즐겨찾기 제거";
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

		return "redirect:/project";
	}



}
