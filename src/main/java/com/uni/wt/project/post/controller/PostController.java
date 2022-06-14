package com.uni.wt.project.post.controller;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.post.model.dto.Post;
import com.uni.wt.project.post.model.service.PostService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class PostController {
    private static final Logger log = LoggerFactory.getLogger(PostController.class);

   @Autowired
   PostService postService;


    private Map<String, String> msgMap = new HashMap<String, String>();



    @RequestMapping("/insertPost.do")
    public String insertPost(Post post,  BoardAll boardAll, @RequestParam("pj_no") int pj_no , HttpSession session,
                             Model m, RedirectAttributes redirect) throws Exception {
        log.info("글 : " + post);

        boardAll.setBoard_type("post");
        boardAll.setPj_no(pj_no);
        log.info("로그인 유저 : " + session.getAttribute("loginEmp"));
        boardAll.setWriter(((Employee)session.getAttribute("loginEmp")).getEmp_no());

        postService.insertPost(post, boardAll);

        msgMap.put("msg", "게시물 등록 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        return "redirect:/detailPj.do?pj_no=" + pj_no;
    }
}
