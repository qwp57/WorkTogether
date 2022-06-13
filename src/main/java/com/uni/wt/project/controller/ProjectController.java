package com.uni.wt.project.controller;

import com.google.gson.GsonBuilder;
import com.uni.wt.employee.controller.EmployeeController;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.employee.model.service.EmployeeService;
import com.uni.wt.project.boardAll.dto.BoardAll;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.service.ProjectService;
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

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	private static final Logger log = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;

	private Map<String, String> msgMap = new HashMap<String, String>();

	@RequestMapping("/allProject.do")
	public String allProject() {

		return "project/allProject";
	}
	@ResponseBody
	@RequestMapping(value = "/selectAllProjcet", produces="application/json; charset=utf-8")
	public String selectAllProject() throws Exception {
		ArrayList<Project> list = projectService.selectAllProject();
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
	public String inseretProject(@Valid Project project, RedirectAttributes redirect) throws Exception {
		log.info(project.toString());

		projectService.insertProject(project);
		msgMap.put("msg", "프로젝트 생성 완료.");
		redirect.addFlashAttribute("msg", msgMap);

		return "redirect:/allProject.do";
	}

	@RequestMapping("/insertPost.do")
	public String insertPost(@RequestParam("board_title") String board_title, @RequestParam("pj_no") int pj_no,
							 @RequestParam("board_content") String board_content,
							 Model m, RedirectAttributes redirect) throws Exception {
		log.info("글내용 : " + board_content);

		BoardAll boardAll = new BoardAll();
		boardAll.setBoard_type(1);
		boardAll.setPj_no(pj_no);
		//boardAll.setWriter( 작성자 세션에서 넣기 );
		//kos

		//projectService.insertPost(board_title, board_content, pj_no);
		msgMap.put("msg", "게시물 등록 완료.");
		redirect.addFlashAttribute("msg", msgMap);

		return "redirect:/detailPj.do?pj_no=" + pj_no;
	}

}
