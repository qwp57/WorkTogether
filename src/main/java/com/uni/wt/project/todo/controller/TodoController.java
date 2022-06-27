package com.uni.wt.project.todo.controller;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.service.BoardAllService;
import com.uni.wt.project.schedule.controller.ScheduleController;
import com.uni.wt.project.schedule.model.dto.Schedule;
import com.uni.wt.project.schedule.model.service.ScheduleService;
import com.uni.wt.project.todo.model.dto.Todo;
import com.uni.wt.project.todo.model.service.TodoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/todo")
public class TodoController {
    private static final Logger log = LoggerFactory.getLogger(TodoController.class);

    @Autowired
    TodoService todoService;
    @Autowired
    BoardAllService boardAllService;

    private Map<String, String> msgMap = new HashMap<String, String>();

    @RequestMapping("/insertTodo.do")
    public String insertTodo(Todo todo,BoardAll boardAll, @RequestParam("pj_no") int pj_no, HttpSession session,
                             RedirectAttributes redirect, HttpServletRequest request) throws Exception {
        log.info("글 : " + todo);


        boardAll.setBoard_type("todo");
        boardAll.setPj_no(pj_no);

        log.info("로그인 유저 : " + session.getAttribute("loginEmp"));
        boardAll.setWriter(((Employee) session.getAttribute("loginEmp")).getEmp_no());

        //todoService.insertTodo(todo, boardAll);

        msgMap.put("msg", "게시물 등록 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }
}
