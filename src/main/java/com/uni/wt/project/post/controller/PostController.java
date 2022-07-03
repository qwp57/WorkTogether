package com.uni.wt.project.post.controller;

import com.google.gson.GsonBuilder;
import com.uni.wt.common.commonFile.FileService;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.boardAll.model.service.BoardAllService;
import com.uni.wt.project.model.dto.ProjectFile;
import com.uni.wt.project.model.service.ProjectFileService;
import com.uni.wt.project.post.model.dto.Post;
import com.uni.wt.project.post.model.service.PostService;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.project.projectMember.model.service.ProjectMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostController {
    private static final Logger log = LoggerFactory.getLogger(PostController.class);

    @Autowired
    PostService postService;
    @Autowired
    BoardAllService boardAllService;
    @Autowired
    private ProjectFileService projectFileService;
    @Autowired
    private ProjectMemberService projectMemberService;
    @Autowired
    private NoticeService noticeService;

    private Map<String, String> msgMap = new HashMap<String, String>();


    @RequestMapping("/insertPost.do")
    public String insertPost(Post post, BoardAll boardAll, @RequestParam("pj_no") int pj_no, HttpSession session,
                             @RequestParam(name = "upload_file", required = false) MultipartFile file, @RequestParam("isImage") String isImage,
                             RedirectAttributes redirect, HttpServletRequest request) throws Exception {
        log.info("글 : " + post);
        boardAll.setBoard_type("post");
        boardAll.setPj_no(pj_no);
        Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
        log.info("로그인 유저 : " + emp);
        boardAll.setWriter(emp.getEmp_no());
        HashMap<String, Object> content = new HashMap<String, Object>();
        content.put("POST", post);
        int board_no = postService.insertPost(post, boardAll);
        if (post.getPost_for() != null) {
            String[] postForList = post.getPost_for().split(",");
            if (postForList.length > 0) {
                for (String emp_no : postForList) {

                    noticeService.insertNotice(Integer.parseInt(emp_no), emp, content, "POST");
                }
            }
        }
        if (!file.getOriginalFilename().equals("")) {//만약 받아온 파일이 비어 있어있지 않으면
            projectFileService.uploadFile(file, request, board_no, isImage);
        }


        msgMap.put("msg", "게시물 등록 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        return "redirect:/project/detailPj.do?pj_no=" + pj_no;
    }

    @RequestMapping("/editPost.do")
    public String editPost(Post post, ProjectFile projectFile, @RequestParam("pj_no") int pj_no,
                           @RequestParam(name = "upload_file", required = false) MultipartFile file, @RequestParam("isImage") String isImage,
                           RedirectAttributes redirect, HttpServletRequest request, String type) throws Exception {
        log.info("글 : " + post);
        log.info("삭제할 파일 : " + projectFile);
        Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
        if (projectFile.getFile_no() > 0) {
            projectFileService.deleteFile(projectFile);
        }
        postService.editPost(post);
        HashMap<String, Object> content = new HashMap<String, Object>();
        content.put("POST", post);
        if (post.getPost_for() != null) {
            String[] postForList = post.getPost_for().split(",");
            if (postForList.length > 0) {
                for (String emp_no : postForList) {
                    noticeService.insertNotice(Integer.parseInt(emp_no), emp, content, "POST");
                }
            }
        }
        if (!file.getOriginalFilename().equals("")) {//만약 받아온 파일이 비어 있어있지 않으면

            projectFileService.uploadFile(file, request, post.getBoard_no(), isImage);
        }

        log.info("글리턴 : " + type);
        msgMap.put("msg", "게시물 수정 완료.");
        redirect.addFlashAttribute("msg", msgMap);

        if (type.equals("")) {
            return "redirect:/project/detailPj.do?pj_no=" + pj_no;
        } else if (type.equals("myBoard")) {
            return "redirect:/project/myBoard.do";
        } else {
            return "redirect:/project/";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/detailView.do", produces = "application/json; charset=utf-8")
    public String detailView(@RequestParam("board_no") int board_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
        Cookie[] cookies = request.getCookies();
        Cookie viewCookie = null; // 비교하기 위해 새로운 쿠키


        // 쿠키가 있을 경우
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                // Cookie의 name이 cookie + boardNo와 일치하는 쿠키를 viewCookie에 넣어줌
                if (cookie.getName().equals("cookie" + board_no)) {

                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
                    viewCookie = cookie;
                }
            }
        }

        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
        if (viewCookie == null) {
            log.info("cookie 없음");
            Cookie newCookie = new Cookie("cookie" + board_no, "|" + board_no + "|"); // 쿠키 생성(이름, 값)
            response.addCookie(newCookie); // 쿠키 추가
            boardAllService.increaseCount(board_no); // 쿠키를 추가 시키고 조회수 증가시킴
        } else {
            log.info("cookie 있음");
            String value = viewCookie.getValue(); // 쿠키 값 받아옴.
            log.info("cookie 값 : " + value);
        }
        ProjectFile projectFile = projectFileService.getFileByBoardNo(board_no);
        Post post = postService.detailView(board_no);
        log.info("포스트 조회 : " + post);
        Map<String, Object> map = new HashMap<>();
        map.put("post", post);
        if (post.getPost_for() != null) {
            String[] postForList = post.getPost_for().split(",");
            if (postForList.length > 0) {
                ArrayList<Employee> list = new ArrayList<>();
                for (String emp_no : postForList) {
                    Employee emp = projectMemberService.selectEmpByEmpNo(Integer.parseInt(emp_no));
                    list.add(emp);
                }
                map.put("postForEmpList", list);
            }
        }

        if (projectFile != null) {
            map.put("projectFile", projectFile);
        }

        return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create().toJson(map);
    }

}
