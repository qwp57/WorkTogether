package com.uni.wt.project.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.boardAll.model.service.BoardAllService;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.service.ProjectService;
import com.uni.wt.project.post.model.dto.Post;
import com.uni.wt.project.post.model.service.PostService;
import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.project.projectMember.model.service.ProjectMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    @Autowired
    PostService postService;
    @Autowired
    private BoardAllService boardAllService;
    private Map<String, String> msgMap = new HashMap<String, String>();

    @RequestMapping("")
    public String allProject() {

        return "project/allProject";

    }

    @ResponseBody
    @RequestMapping(value = "/selectAllProject.do", produces = "application/json; charset=utf-8")
    public String selectAllProject(HttpSession session) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        ArrayList<Project> myProjects = projectService.selectMyProject(loginEmp);
        for (int i = 0; i < myProjects.size(); i++) {
            myProjects.get(i).setCount(projectService.getProjectMemberCount(myProjects.get(i).getPj_no()));
        }
        ArrayList<Project> bookmarkProjects = projectService.selectMyBookmarkProject(loginEmp);
        for (int i = 0; i < bookmarkProjects.size(); i++) {
            bookmarkProjects.get(i).setCount(projectService.getProjectMemberCount(bookmarkProjects.get(i).getPj_no()));
        }
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        log.info("bookmarkProjects : " + bookmarkProjects);
        ArrayList myAllProjects = new ArrayList();
        myAllProjects.add(myProjects);
        myAllProjects.add(bookmarkProjects);
        return gson.toJson(myAllProjects);
    }

    @ResponseBody
    @RequestMapping(value = "/selectAllBoard.do", produces = "application/json; charset=utf-8")
    public String selectAllBoard(@RequestParam("pj_no") int pj_no) throws Exception {

        ArrayList<BoardAll> allBoards = boardAllService.selectAllBoard(pj_no);

        //log.info("게시물 전체 조회 : " + new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(allBoards));
        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(allBoards);
    }

    @ResponseBody
    @RequestMapping(value = "/selectProjectColor.do", produces = "application/json; charset=utf-8")
    public String selectProjectColor(HttpSession session) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        ArrayList<ProjectMember> list = projectMemberService.selectProjectColorByEmpNo(loginEmp);
        return new GsonBuilder().create().toJson(list);
    }

    @ResponseBody
    @RequestMapping(value = "/setProjectColor.do", produces = "application/json; charset=utf-8")
    public String setProjectColor(HttpSession session, @RequestParam("selectedProjects[]") List<String> list, @RequestParam("selectedColor") String color) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        log.info("선택된 프로젝트 : " + list.toString());
        for (int i = 0; i < list.size(); i++) {
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
    @RequestMapping(value = "/setProjectTag.do", produces = "application/json; charset=utf-8")
    public String setProjectTag(@RequestParam("selectedProjects[]") List<String> pj_list, @RequestParam("selectedTags[]") List<String> tag_list) throws Exception {

        for (int i = 0; i < pj_list.size(); i++) {
            for (int j = 0; j < tag_list.size(); j++) {
                ProjectTag projectTag = new ProjectTag();
                projectTag.setTag_no(Integer.parseInt(tag_list.get(j)));
                projectTag.setPj_no(Integer.parseInt(pj_list.get(i)));
                //log.info("프로젝트 태그 : " + projectTag);
                int check = projectMemberService.checkProjectByTag(projectTag);
                //log.info("중복 되는 태그설정 : " + projectTag + check);
                if (check == 0) {
                    projectMemberService.setProjectTag(projectTag);
                }
            }
        }
        return "태그 설정 완료";
    }


    @ResponseBody
    @RequestMapping(value = "/addTag.do", produces = "application/json; charset=utf-8")
    public String addTag(HttpSession session, @RequestParam("tag_name") String tag_name) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        //log.info("태그 명 : " + tag_name);
        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_name(tag_name);
        pjTag.setEmp_no(loginEmp);
        projectService.addTag(pjTag);
        return "태그 등록 성공";
    }

    @ResponseBody
    @RequestMapping(value = "/editTag.do", produces = "application/json; charset=utf-8")
    public String editTag(@RequestParam("tag_no") int tag_no, @RequestParam("tag_name") String tag_name) throws Exception {

        log.info("태그 번호 : " + tag_no);
        log.info("태그 명 : " + tag_name);
        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_no(tag_no);
        pjTag.setTag_name(tag_name);
        projectService.editTag(pjTag);
        return "태그 수정 성공";
    }

    @ResponseBody
    @RequestMapping(value = "/selectEmpListByPj.do", produces = "application/json; charset=utf-8")
    public String selectEmpListByPj(@RequestParam("pj_no") int pj_no) throws Exception {

        ArrayList<Employee> list =  projectService.selectEmpListByPj(pj_no);

        return new GsonBuilder().create().toJson(list);
    }
    @ResponseBody
    @RequestMapping(value = "/editReply.do", produces = "application/json; charset=utf-8")
    public String editReply(Reply reply) throws Exception {

        projectService.editReply(reply);

        return "댓글 수정 성공";
    }

    @ResponseBody
    @RequestMapping(value = "/removeTag.do", produces = "application/json; charset=utf-8")
    public String removeTag(@RequestParam("tag_no") int tag_no) throws Exception {

        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_no(tag_no);
        projectService.removeTag(pjTag);
        return "태그 삭제 성공";
    }

    @ResponseBody
    @RequestMapping(value = "/removeTagByPjNo.do", produces = "application/json; charset=utf-8")
    public String removeTagByPjNo(ProjectTag projectTag) throws Exception {

        projectMemberService.removeTagByPjNo(projectTag);
        return "태그 삭제 성공";
    }


    @ResponseBody
    @RequestMapping(value = "/insertBookmark.do", produces = "application/text;charset=utf8")
    public String insertBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

        pjm.setPj_no(pj_no);
        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        projectMemberService.insertBookmark(pjm);

        return "즐겨찾기 추가";
    }

    @ResponseBody
    @RequestMapping(value = "/removeBookmark.do", produces = "application/text;charset=utf8")
    public String removeBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

        pjm.setPj_no(pj_no);
        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        projectMemberService.removeBookmark(pjm);

        return "즐겨찾기 제거";
    }
    @ResponseBody
    @RequestMapping(value = "/selectReply.do", produces = "application/text;charset=utf8")
    public String selectReply(@RequestParam("board_no") int board_no) throws Exception {

        ArrayList<Reply> reply = boardAllService.selectReply(board_no);
        log.info("댓글 조회 : " + reply);

        return  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(reply);
    }
    @ResponseBody
    @RequestMapping(value = "/deleteReply.do", produces = "application/text;charset=utf8")
    public String deleteReply(@RequestParam("reply_no") int reply_no) throws Exception {

        boardAllService.deleteReply(reply_no);

        return "댓글 삭제 성공";
    }

    @ResponseBody
    @RequestMapping(value = "/loadTag.do", produces = "application/text;charset=utf8")
    public String loadTag(HttpSession session, @RequestParam(value = "pj_no", required = false) String pj_noStr) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        ArrayList<ProjectTag> list = projectMemberService.loadTag(loginEmp);
        if (pj_noStr != null) {
            int pj_no = Integer.parseInt(pj_noStr);
            ProjectTag projectTag = new ProjectTag();
            projectTag.setEmp_no(loginEmp);
            projectTag.setPj_no(pj_no);
            ArrayList<ProjectTag> tagListByPjNo = projectMemberService.loadTagByPj(projectTag);
            log.info("pj_no에 등록된 태그" + tagListByPjNo.toString());
            Map<String, ArrayList<ProjectTag>> map = new HashMap<>();
            map.put("tagByEmpNo", list);
            map.put("tagByPjNo", tagListByPjNo);
            return new GsonBuilder().create().toJson(map);

        } else {
            log.info(list.toString());

            return new GsonBuilder().create().toJson(list);
        }

    }


    @RequestMapping("/detailPj.do")
    public String detailPj(@RequestParam("pj_no") int pj_no, Model m, HttpSession session) throws Exception {

        ProjectTag projectTag = new ProjectTag();
        projectTag.setPj_no(pj_no);
        projectTag.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        ArrayList<ProjectMember> list = projectMemberService.selectProjectColor(projectTag);
        //log.info("색상 단건조회 : " + list.toString());
        Project pj = projectService.selectOneProject(pj_no);
        //log.info("프로젝트 상세보기 pj : " + pj);
        int checkBookmark = projectMemberService.checkBookmark(projectTag);

        m.addAttribute("checkBookmark", checkBookmark);
        m.addAttribute("pj", pj);
        m.addAttribute("pjMember", list.get(0));
        return "project/detailPj";
    }

    @RequestMapping("/deleteBoard.do")
    public String deleteBoard(@RequestParam("board_no") int board_no, @RequestParam("pj_no") int pj_no) throws Exception {
        log.info("board_no : " + board_no);
		boardAllService.deleteBoard(board_no);
        log.info("테스트");
        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }

    @RequestMapping("/tagViewSelect.do")
    public ModelAndView tagViewSelect(@RequestParam("tag_no") int tag_no, @RequestParam("tag_name") String tag_name, ModelAndView mv) {
        ProjectTag projectTag = new ProjectTag();
        projectTag.setTag_no(tag_no);
        projectTag.setTag_name(tag_name);
        log.info("태그확인 : " + projectTag);
        mv.addObject("projectTag", projectTag).setViewName("project/projectViewByTag");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/tagView.do", produces = "application/json; charset=utf-8")
    public String tagView(@RequestParam("tag_no") int tag_no, @RequestParam("tag_name") String tag_name, HttpSession session) throws Exception {

        ProjectTag projectTag = new ProjectTag();
        projectTag.setTag_no(tag_no);
        projectTag.setTag_name(tag_name);
        projectTag.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());

        ArrayList<Project> myProjectsByTag = projectService.selectMyProjectByTag(projectTag);
        for (int i = 0; i < myProjectsByTag.size(); i++) {
            myProjectsByTag.get(i).setCount(projectService.getProjectMemberCount(myProjectsByTag.get(i).getPj_no()));
        }
        ArrayList<Project> bookmarkProjectsByTag = projectService.selectMyBookmarkProjectByTag(projectTag);
        for (int i = 0; i < bookmarkProjectsByTag.size(); i++) {
            bookmarkProjectsByTag.get(i).setCount(projectService.getProjectMemberCount(bookmarkProjectsByTag.get(i).getPj_no()));
        }


        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        ArrayList myAllProjectsByTag = new ArrayList();
        myAllProjectsByTag.add(myProjectsByTag);
        myAllProjectsByTag.add(bookmarkProjectsByTag);
        myAllProjectsByTag.add(projectTag);
        log.info(myAllProjectsByTag.toString());
        return gson.toJson(myAllProjectsByTag);
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
    public String mentionedBoard() {
        return "project/mentionedBoard";
    }

    @RequestMapping("/myBoard.do")
    public String myBoard() {
        return "project/myBoard";
    }

    @RequestMapping("/allCalendar.do")
    public String allCalendar() {
        return "project/allCalendar";
    }

    @RequestMapping("/enrollProject.do")
    public String enrollProject() {
        return "project/pjForm";
    }

    @RequestMapping("/storedPj.do")
    public String storedPj() {
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

        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        pjm.setPj_no(pj_no);
        projectMemberService.insertProjectMember(pjm);
        msgMap.put("msg", "프로젝트 생성 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        return "redirect:/project";
    }
    @ResponseBody
    @RequestMapping("/insertReply.do")
    public String insertReply(Reply reply, HttpSession session) throws Exception {
        reply.setWriter(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        //log.info(reply.toString());

        boardAllService.insertReply(reply);
        return "댓글 등록 성공";
    }


}
