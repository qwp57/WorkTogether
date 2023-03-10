package com.uni.wt.project.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.boardAll.model.service.BoardAllService;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.dto.ProjectFile;
import com.uni.wt.project.model.service.ProjectFileService;
import com.uni.wt.project.model.service.ProjectService;
import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.project.projectMember.model.service.ProjectMemberService;
import com.uni.wt.project.schedule.model.dto.Schedule;
import com.uni.wt.project.schedule.model.service.ScheduleService;
import com.uni.wt.project.todo.model.service.TodoService;
import com.uni.wt.requestWork.model.dto.RequestWork;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private ProjectFileService projectFileService;
    @Autowired
    private TodoService todoService;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private BoardAllService boardAllService;
    @Autowired
    private NoticeService noticeService;

    private Map<String, String> msgMap = new HashMap<String, String>();

    @RequestMapping("")
    public String allProject() {

        return "project/allProject";

    }

    @ResponseBody
    @RequestMapping(value = "/selectProject.do", produces = "application/json; charset=utf-8")
    public String selectAllProject(HttpSession session, String type) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        ArrayList<Project> myProjects = projectService.selectMyProject(loginEmp, type);
        for (int i = 0; i < myProjects.size(); i++) {
            myProjects.get(i).setCount(projectService.getProjectMemberCount(myProjects.get(i).getPj_no()));
        }
        ArrayList<Project> bookmarkProjects = projectService.selectMyBookmarkProject(loginEmp, type);
        for (int i = 0; i < bookmarkProjects.size(); i++) {
            bookmarkProjects.get(i).setCount(projectService.getProjectMemberCount(bookmarkProjects.get(i).getPj_no()));
        }
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        //log.info("bookmarkProjects : " + bookmarkProjects);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("myProjects", myProjects);
        map.put("bookmarkProjects", bookmarkProjects);
        return gson.toJson(map);
    }

    @ResponseBody
    @RequestMapping(value = "/selectOneProject.do", produces = "application/json; charset=utf-8")
    public String selectOneProject(HttpSession session, int pj_no) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        Project project = projectService.selectOneProject(pj_no);
        ProjectTag projectTag = new ProjectTag();
        projectTag.setEmp_no(loginEmp);
        projectTag.setPj_no(pj_no);
        ProjectMember pjMember = projectMemberService.selectProjectColor(projectTag);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("pjMember", pjMember);
        map.put("pj", project);
        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(map);
    }
    @RequestMapping(value = "/invitePj.do", produces = "application/json; charset=utf-8")
    public String invitePj(@RequestParam("inviteEmpNo") int[] emp_no, @RequestParam("pj_no") int pj_no, HttpSession session, RedirectAttributes redirect) throws Exception {
        Employee emp = (Employee) session.getAttribute("loginEmp");
        HashMap<String, Object> content = new HashMap<String, Object>();
        content.put("PJ_INVITE", pj_no);
        for (int i : emp_no) {
            log.info("?????? : " + i);
            ProjectMember pjm = new ProjectMember();
            pjm.setEmp_no(i);
            pjm.setPj_no(pj_no);
            pjm.setAdmin("N");
            log.info(pjm.toString());
            //projectMemberService.insertProjectMember(pjm);
            noticeService.insertNotice(i, emp, content, "PJ_INVITE");
        }
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");
        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }

    @RequestMapping(value = "/inputToPj.do", produces = "application/json; charset=utf-8")
    public String inputToPj(@RequestParam("pj_no") int pj_no, HttpSession session, RedirectAttributes redirect) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        log.info("?????? : " + loginEmp);

        ProjectMember pjm = new ProjectMember();
        pjm.setEmp_no(loginEmp);
        pjm.setPj_no(pj_no);
        pjm.setAdmin("N");
        log.info(pjm.toString());
            projectMemberService.insertProjectMember(pjm);
            redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");

        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }


    private Map<String, Object> getBoardList(int pj_no, int currentPage, String boardType, int emp_no, SearchDto sd) throws Exception {
        //????????? ?????? ????????? ?????? ??????
        int listCount = boardAllService.getListCount(pj_no, boardType, emp_no, sd);
        log.info("[???????????? ????????? ????????? ??????] : {}", listCount);

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

        ArrayList<BoardAll> list = boardAllService.selectPjBoardList(pj_no, pi, boardType, emp_no, sd);
        log.info("[???????????? ????????? ?????????] : {}", list);
        for (BoardAll b : list) {
            if (b.getBoard_type().equals("todo"))
                b.setTodo_percent(todoService.getTodoPercent(b.getBoard_no()));
        }
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("list", list);
        map.put("pi", pi);

        return map;
    }

//    @ResponseBody
//    @RequestMapping(value = "/selectAllBoard.do", produces = "application/json; charset=utf-8")
//    public String selectAllBoard(@RequestParam("pj_no") int pj_no) throws Exception {
//
//        //ArrayList<BoardAll> allBoards = boardAllService.selectAllBoard(pj_no);
//        Map<String, Object> allBoardsMap = responsList(pj_no, 1, "");
//        for (BoardAll b : (ArrayList<BoardAll>) allBoardsMap.get("list")) {
//            if (b.getBoard_type().equals("todo")) {
//                b.setTodo_percent(todoService.getTodoPercent(b.getBoard_no()));
//            }
//        }
//        //log.info("????????? ?????? ?????? : " + new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(allBoards));
//        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(allBoardsMap);
//    }

    @ResponseBody
    @RequestMapping(value = "/pagingAndSerachPj.do", produces = "application/text; charset=UTF-8")
    public String pagingAndSerachPj(BoardAll boardAll, SearchDto sd, Project pj, int currentPage, HttpSession session) throws Exception {
        int emp_no = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        log.info("sd : " + sd);
        Map<String, Object> map = getBoardList(pj.getPj_no(), currentPage, boardAll.getBoard_type(), emp_no, sd);

        return new Gson().toJson(map);
    }

    @ResponseBody
    @RequestMapping(value = "/selectProjectColor.do", produces = "application/json; charset=utf-8")
    public String selectProjectColor(HttpSession session) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        ArrayList<ProjectMember> list = projectMemberService.selectProjectColorByEmpNo(loginEmp);
        return new GsonBuilder().create().toJson(list);
    }

    @RequestMapping(value = "/quitProject.do")
    public String quitProject(RedirectAttributes redirect, HttpSession session, @RequestParam("pj_no") int pj_no) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        ProjectMember pjMember = new ProjectMember();
        pjMember.setPj_no(pj_no);
        pjMember.setEmp_no(loginEmp);
        projectMemberService.quitProject(pjMember);
        redirect.addFlashAttribute("msg", "???????????? ????????? ??????.");
        return "redirect:/project";
    }

    @ResponseBody
    @RequestMapping(value = "/setProjectColor.do", produces = "application/json; charset=utf-8")
    public String setProjectColor(HttpSession session, @RequestParam("selectedProjects[]") List<String> list, @RequestParam("selectedColor") String color) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        log.info("????????? ???????????? : " + list.toString());
        for (int i = 0; i < list.size(); i++) {
            ProjectMember pjm = new ProjectMember();
            pjm.setEmp_no(loginEmp);
            pjm.setPj_color(color);
            pjm.setPj_no(Integer.parseInt(list.get(i)));
            projectMemberService.setProjectColor(pjm);
        }
        log.info("?????? : " + color);
        return new GsonBuilder().create().toJson(color);
    }

    @ResponseBody
    @RequestMapping(value = "/setProjectTag.do", produces = "application/json; charset=utf-8")
    public String setProjectTag(@RequestParam("selectedProjects[]") List<String> pj_list, @RequestParam("selectedTags[]") List<String> tag_list) throws Exception {

        for (int i = 0; i < pj_list.size(); i++) {
            for (int j = 0; j < tag_list.size(); j++) {
                ProjectTag projectTag = new ProjectTag();
                projectTag.setTag_no(Integer.parseInt(tag_list.get(j)));
                projectTag.setPj_no(Integer.parseInt(pj_list.get(i)));
                //log.info("???????????? ?????? : " + projectTag);
                int check = projectMemberService.checkProjectByTag(projectTag);
                //log.info("?????? ?????? ???????????? : " + projectTag + check);
                if (check == 0) {
                    projectMemberService.setProjectTag(projectTag);
                }
            }
        }
        return "?????? ?????? ??????";
    }


    @ResponseBody
    @RequestMapping(value = "/addTag.do", produces = "application/json; charset=utf-8")
    public String addTag(HttpSession session, @RequestParam("tag_name") String tag_name) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();

        //log.info("?????? ??? : " + tag_name);
        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_name(tag_name);
        pjTag.setEmp_no(loginEmp);
        projectService.addTag(pjTag);
        return "?????? ?????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/editTag.do", produces = "application/json; charset=utf-8")
    public String editTag(@RequestParam("tag_no") int tag_no, @RequestParam("tag_name") String tag_name) throws Exception {

        log.info("?????? ?????? : " + tag_no);
        log.info("?????? ??? : " + tag_name);
        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_no(tag_no);
        pjTag.setTag_name(tag_name);
        projectService.editTag(pjTag);
        return "?????? ?????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/selectEmpListByPj.do", produces = "application/json; charset=utf-8")
    public String selectEmpListByPj(@RequestParam("pj_no") int pj_no, @RequestParam(value = "keyword", required = false) String keyword) throws Exception {

        ArrayList<Employee> list = new ArrayList<>();
        if (keyword != null) {
            list = projectService.selectEmpListByPj(pj_no);
        } else {
            list = projectService.selectEmpInviteList(pj_no);
        }
        return new GsonBuilder().create().toJson(list);

    }

    @ResponseBody
    @RequestMapping(value = "/selectBoardProfilePic.do", produces = "application/json; charset=utf-8")
    public String selectBoardProfilePic(@RequestParam("board_no") int board_no) throws Exception {
        String change_name = projectService.selectBoardProfilePic(board_no);
        return new GsonBuilder().create().toJson(change_name);

    }

    @ResponseBody
    @RequestMapping(value = "/editReply.do", produces = "application/json; charset=utf-8")
    public String editReply(Reply reply) throws Exception {

        projectService.editReply(reply);

        return "?????? ?????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/deportEmp.do", produces = "application/json; charset=utf-8")

    public String deportEmp(int pj_no, int emp_no) throws Exception {
        log.info("???????????? ?????? : " + pj_no);
        log.info("?????? ?????? : " + emp_no);
        ProjectMember pjMember = new ProjectMember();
        pjMember.setPj_no(pj_no);
        pjMember.setEmp_no(emp_no);
        projectMemberService.quitProject(pjMember);

        return "test";
    }

    @ResponseBody
    @RequestMapping(value = "/setAdmin.do", produces = "application/json; charset=utf-8")
    public String setAdmin(int pj_no, int emp_no) throws Exception {
        log.info("???????????? ?????? : " + pj_no);
        log.info("?????? ?????? : " + emp_no);
        ProjectMember pjMember = new ProjectMember();
        pjMember.setPj_no(pj_no);
        pjMember.setEmp_no(emp_no);
        projectMemberService.setAdmin(pjMember);
        return "test";
    }

    @ResponseBody
    @RequestMapping(value = "/removeTag.do", produces = "application/json; charset=utf-8")
    public String removeTag(@RequestParam("tag_no") int tag_no) throws Exception {

        ProjectTag pjTag = new ProjectTag();
        pjTag.setTag_no(tag_no);
        projectService.removeTag(pjTag);
        return "?????? ?????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/removeTagByPjNo.do", produces = "application/json; charset=utf-8")
    public String removeTagByPjNo(ProjectTag projectTag) throws Exception {

        projectMemberService.removeTagByPjNo(projectTag);
        return "?????? ?????? ??????";
    }


    @ResponseBody
    @RequestMapping(value = "/insertBookmark.do", produces = "application/text;charset=utf8")
    public String insertBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

        pjm.setPj_no(pj_no);
        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        projectMemberService.insertBookmark(pjm);

        return "???????????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/removeBookmark.do", produces = "application/text;charset=utf8")
    public String removeBookmark(@RequestParam("pj_no") int pj_no, HttpSession session, ProjectMember pjm) throws Exception {

        pjm.setPj_no(pj_no);
        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        projectMemberService.removeBookmark(pjm);

        return "???????????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/selectReply.do", produces = "application/text;charset=utf8")
    public String selectReply(@RequestParam("board_no") int board_no) throws Exception {

        ArrayList<Reply> reply = boardAllService.selectReply(board_no);
        log.info("?????? ?????? : " + reply);

        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(reply);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteReply.do", produces = "application/text;charset=utf8")
    public String deleteReply(@RequestParam("reply_no") int reply_no) throws Exception {

        boardAllService.deleteReply(reply_no);

        return "?????? ?????? ??????";
    }

    @ResponseBody
    @RequestMapping(value = "/loadRw.do", produces = "application/text;charset=utf8")
    public String loadRw(@RequestParam("pj_no") int pj_no) throws Exception {

        ArrayList<RequestWork> list = projectService.loadRw(pj_no);

        return new GsonBuilder().create().toJson(list);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteFile.do", produces = "application/text;charset=utf8")
    public String deleteFile(@RequestParam("file_no[]") int[] file_no) throws Exception {

        log.info("????????? ?????? : " + file_no.toString());
        for (int i : file_no) {
            projectFileService.deleteFile(projectFileService.getFileByFileNo(i));
        }
        return new GsonBuilder().create().toJson("?????? ?????? ??????");
    }

    @ResponseBody
    @RequestMapping(value = "/fileSort.do", produces = "application/text;charset=utf8")
    public String fileSort(@RequestParam("pj_no") int pj_no, @RequestParam("sort") String sort) throws Exception {

        ArrayList<ProjectFile> fList = projectService.getPjFiles(pj_no, sort);
        log.info("??????????????? : " + fList);

        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(fList);
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
            log.info("pj_no??? ????????? ??????" + tagListByPjNo.toString());
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
        ProjectMember pjMember = projectMemberService.selectProjectColor(projectTag);
        log.info("?????? ???????????? : " + pjMember);
        Project pj = projectService.selectOneProject(pj_no);
        //log.info("???????????? ???????????? pj : " + pj);
        int checkBookmark = projectMemberService.checkBookmark(projectTag);

        m.addAttribute("checkBookmark", checkBookmark);
        m.addAttribute("pj", pj);
        m.addAttribute("pjMember", pjMember);
        return "project/detailPj";
    }
    @ResponseBody
    @RequestMapping("/deleteBoard.do")
    public String deleteBoard(RedirectAttributes redirect, int board_no, int pj_no, String type, ProjectFile projectFile) throws Exception {
        log.info("board_no : " + board_no);
        boardAllService.deleteBoard(board_no);
        if (projectFile.getFile_no() > 0) {
            log.info("?????????????????? : {}",projectFile.toString());
            projectFileService.deleteFile(projectFile);
        }

        redirect.addFlashAttribute("msg", "????????? ?????? ??????.");

       return "????????? ?????? ??????";
    }

    @RequestMapping("/editPj.do")
    public String editPj(RedirectAttributes redirect, Project project, String type) throws Exception {
        log.info("???????????? : " + project);
        projectService.editPj(project);
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");

        if (type.equals("calendar")) {
            return "redirect:/project/detailCalendar.do?pj_no=" + project.getPj_no();
        } else if (type.equals("home")) {
            return "redirect:/project/detailPj.do?pj_no=" + project.getPj_no();
        } else if (type.equals("drive")) {
            return "redirect:/project/drivePj.do?pj_no=" + project.getPj_no();
        } else {
            return "redirect:/project/";
        }

    }

    @RequestMapping("/deleteProject.do")
    public String deleteProject(@RequestParam("pj_no") int pj_no, RedirectAttributes redirect) throws Exception {
        projectService.deleteProject(pj_no);
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");
        return "redirect:/project";
    }

    @RequestMapping("/keepProject.do")
    public String keepProject(@RequestParam("pj_no") int pj_no, RedirectAttributes redirect) throws Exception {
        projectService.keepProject(pj_no);
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");
        return "redirect:/project/storedPj.do";
    }

    @RequestMapping("/restoreProject.do")
    public String restoreProject(@RequestParam("pj_no") int pj_no, RedirectAttributes redirect) throws Exception {
        projectService.restoreProject(pj_no);
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");
        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }

    @RequestMapping("/tagViewSelect.do")
    public ModelAndView tagViewSelect(@RequestParam("tag_no") int tag_no, @RequestParam("tag_name") String tag_name, ModelAndView mv) {
        ProjectTag projectTag = new ProjectTag();
        projectTag.setTag_no(tag_no);
        projectTag.setTag_name(tag_name);
        log.info("???????????? : " + projectTag);
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
    public String detailCalendar(@RequestParam("pj_no") int pj_no, @RequestParam(value = "date", required = false) String date, Model m, HttpSession session) throws Exception {
        ProjectTag projectTag = new ProjectTag();
        projectTag.setPj_no(pj_no);
        projectTag.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        ProjectMember pjMember = projectMemberService.selectProjectColor(projectTag);
        log.info("?????? ???????????? : " + pjMember);
        Project pj = projectService.selectOneProject(pj_no);
        //log.info("???????????? ???????????? pj : " + pj);
        int checkBookmark = projectMemberService.checkBookmark(projectTag);

        ArrayList<Schedule> schList = scheduleService.getCalendarByMonth(pj_no, date);
        m.addAttribute("schList", schList);
        m.addAttribute("checkBookmark", checkBookmark);
        m.addAttribute("pj", pj);
        m.addAttribute("pjMember", pjMember);
        return "project/detailCalendar";
    }

    @RequestMapping("/drivePj.do")
    public String drivePj(@RequestParam("pj_no") int pj_no, Model m, HttpSession session) throws Exception {
        ProjectTag projectTag = new ProjectTag();
        projectTag.setPj_no(pj_no);
        projectTag.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        ProjectMember pjMember = projectMemberService.selectProjectColor(projectTag);
        log.info("?????? ???????????? : " + pjMember);
        Project pj = projectService.selectOneProject(pj_no);
        //log.info("???????????? ???????????? pj : " + pj);
        int checkBookmark = projectMemberService.checkBookmark(projectTag);

        ArrayList<ProjectFile> fList = projectService.getPjFiles(pj_no, "dateDesc");
        log.info("??????????????? : " + fList);
        m.addAttribute("fList", fList);
        m.addAttribute("checkBookmark", checkBookmark);
        m.addAttribute("pj", pj);
        m.addAttribute("pjMember", pjMember);
        return "project/drivePj";
    }


    @RequestMapping("/myBoard.do")
    public String myBoard(HttpSession session, Model m) {

        m.addAttribute("emp_no", ((Employee) session.getAttribute("loginEmp")).getEmp_no());

        return "project/myBoard";
    }

    @RequestMapping("/allCalendar.do")
    public String allCalendar(HttpSession session, Model m) throws Exception {
        int emp_no = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        m.addAttribute("emp_no", emp_no);
        ArrayList<Schedule> schList = scheduleService.getCalendarByEmp(emp_no);
        m.addAttribute("schList", schList);

        return "project/allCalendar";
    }


    @RequestMapping("/storedPj.do")
    public String storedPj() {
        return "project/storedPj";
    }

    @RequestMapping("/selectTag.do")
    public String selectTag() {
        return "project/selectTag";
    }

//    @RequestMapping("/chatinvite.do")
//    public String chatinvite() {
//        return "chat/chatinvite";
//    }
//
//    @RequestMapping("/chatRoom.do")
//    public String chatRoom() {
//        return "chat/chatroom";
//    }

    @RequestMapping("/insertPj.do")
    public String inseretProject(@Valid Project project, RedirectAttributes redirect, ProjectMember pjm, HttpSession session) throws Exception {
        log.info(project.toString());

        int pj_no = projectService.nextPjNo();
        project.setPj_no(pj_no);
        projectService.insertProject(project);

        pjm.setEmp_no(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        pjm.setPj_no(pj_no);
        pjm.setAdmin("Y");
        projectMemberService.insertProjectMember(pjm);
        redirect.addFlashAttribute("msg", "???????????? ?????? ??????.");

        return "redirect:/project";
    }

    @ResponseBody
    @RequestMapping("/insertReply.do")
    public String insertReply(Reply reply, HttpSession session) throws Exception {
        reply.setWriter(((Employee) session.getAttribute("loginEmp")).getEmp_no());
        //log.info(reply.toString());

        boardAllService.insertReply(reply);
        return "?????? ?????? ??????";
    }


}
