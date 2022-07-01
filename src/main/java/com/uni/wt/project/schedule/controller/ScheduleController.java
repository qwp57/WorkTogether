package com.uni.wt.project.schedule.controller;

import com.google.gson.GsonBuilder;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.service.BoardAllService;
import com.uni.wt.project.post.model.dto.Post;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.project.projectMember.model.service.ProjectMemberService;
import com.uni.wt.project.schedule.model.dto.Schedule;
import com.uni.wt.project.schedule.model.service.ScheduleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);

    @Autowired
    ScheduleService scheduleService;
    @Autowired
    BoardAllService boardAllService;
    @Autowired
    private ProjectMemberService projectMemberService;
    private Map<String, String> msgMap = new HashMap<String, String>();

    @RequestMapping("/insertSch.do")
    public String insertSch(Schedule schedule, BoardAll boardAll, @RequestParam("pj_no") int pj_no, HttpSession session,
                            RedirectAttributes redirect, String type) throws Exception {
        log.info("글 : " + schedule);
        boardAll.setBoard_type("schedule");
        boardAll.setPj_no(pj_no);

        log.info("로그인 유저 : " + session.getAttribute("loginEmp"));
        boardAll.setWriter(((Employee) session.getAttribute("loginEmp")).getEmp_no());

        scheduleService.insertSch(schedule, boardAll);

        msgMap.put("msg", "게시물 등록 완료.");
        redirect.addFlashAttribute("msg", msgMap);
        if (type.equals("calendar")){
            return "redirect:/project/detailCalendar.do?pj_no=" + pj_no;
        }else if(type.equals("home")){
            return "redirect:/project/detailPj.do?pj_no=" + pj_no;
        }else {
            return "redirect:/project/";
        }
    }
    @ResponseBody
    @RequestMapping(value = "/detailView.do", produces = "application/json; charset=utf-8")
    public String detailView(@RequestParam("board_no") int board_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
        Cookie[] cookies = request.getCookies();
        Cookie viewCookie = null; // 비교하기 위해 새로운 쿠키


        // 쿠키가 있을 경우
        if(cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                // Cookie의 name이 cookie + boardNo와 일치하는 쿠키를 viewCookie에 넣어줌
                if(cookie.getName().equals("cookie"+board_no)) {

                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
                    viewCookie = cookie;
                }
            }
        }

        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
        if (viewCookie == null) {
            log.info("cookie 없음");
            Cookie newCookie = new Cookie("cookie"+board_no, "|" + board_no + "|"); // 쿠키 생성(이름, 값)
            response.addCookie(newCookie); // 쿠키 추가
            boardAllService.increaseCount(board_no); // 쿠키를 추가 시키고 조회수 증가시킴
        } else {
            log.info("cookie 있음");
            String value = viewCookie.getValue(); // 쿠키 값 받아옴.
            log.info("cookie 값 : " + value);
        }
        Map<String, Object> map = new HashMap<>();
        Schedule schedule = scheduleService.detailView(board_no);
        log.info("일정 조회 : " + schedule);
        map.put("sch", schedule);
//        if(schedule.getSch_attendee() != null){
//            String[] schAttendeeList = schedule.getSch_attendee().split(",");
//            if(schAttendeeList.length > 0){
//                ArrayList<Employee> list = new ArrayList<>();
//                for (String emp_no : schAttendeeList){
//                    Employee emp = projectMemberService.selectEmpByEmpNo(Integer.parseInt(emp_no));
//                    list.add(emp);
//                }
//                map.put("schAttendeeList", list);
//            }
//        }

        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(map);
    }
    @ResponseBody
    @RequestMapping(value = "/selectSchDate.do", produces = "application/json; charset=utf-8")
    public String selectSchDate(@RequestParam("board_no") int board_no) throws Exception {

        Schedule schedule = scheduleService.detailView(board_no);

        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(schedule);
    }
    @ResponseBody
    @RequestMapping(value = "/schJoin.do", produces = "application/json; charset=utf-8")
    public String schJoin(@RequestParam("board_no") int board_no, @RequestParam("status") String status, HttpSession session) throws Exception {
        int loginEmp = ((Employee) session.getAttribute("loginEmp")).getEmp_no();
        Schedule schedule = new Schedule();
        schedule.setBoard_no(board_no);
        schedule.setEmp_no(loginEmp);
        schedule.setStatus(status);
        scheduleService.schJoin(schedule);

        return new GsonBuilder().create().toJson("참석 성공");
    }
    @ResponseBody
    @RequestMapping(value = "/loadSchAttendee.do", produces = "application/json; charset=utf-8")
    public String loadSchAttendee(@RequestParam("board_no") int board_no) throws Exception {
        Schedule y = new Schedule();
        y.setBoard_no(board_no);
        y.setStatus("Y");
        Schedule n = new Schedule();
        n.setBoard_no(board_no);
        n.setStatus("N");
        int yCount = scheduleService.loadSchAttendee(y);
        int nCount = scheduleService.loadSchAttendee(n);
        Map<String, Integer> map = new HashMap<>();
        map.put("yCount", yCount);
        map.put("nCount", nCount);

        return new GsonBuilder().create().toJson(map);
    }
    @ResponseBody
    @RequestMapping(value = "/selectSchAttendee.do", produces = "application/json; charset=utf-8")
    public String selectSchAttendee(@RequestParam("board_no") int board_no) throws Exception {
        ArrayList<Employee> list = scheduleService.selectSchAttendee(board_no);
        return new GsonBuilder().create().toJson(list);
    }

    @RequestMapping("/editSch.do")
    public String editSch(Schedule schedule, int pj_no, String type, RedirectAttributes redirect) throws Exception {
        log.info("일정 : " + schedule);

        scheduleService.editSch(schedule);

        msgMap.put("msg", "게시물 수정 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        if (type.equals("calendar")){
            return "redirect:/project/detailCalendar.do?pj_no=" + pj_no;
        }else if(type.equals("home")){
            return "redirect:/project/detailPj.do?pj_no=" + pj_no;
        }else {
            return "redirect:/project/";
        }
    }
}
