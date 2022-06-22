package com.uni.wt.requestWork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.gson.GsonBuilder;
import com.uni.wt.common.commonFile.FileService;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.common.socket.EchoHandler;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;
import com.uni.wt.requestWork.model.service.RequestService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/requestWork")
public class RequestWorkController {
	
	@Autowired
	private RequestService rwService;
	
	@Autowired
	private FileService fileService;
	
//	@Autowired
//	private EchoHandler echoHandler;
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("/requestWorkMain.do")
	public String requestWorkMain(HttpServletRequest request, Model m) throws Exception {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap != null) {
			Map<String, String> params = (Map<String, String>) flashMap.get("msg");
			
			String msg = params.get("msg");
			
			m.addAttribute("msg", msg);
		}
		
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info(emp.toString());
		ArrayList<Object> deptList = rwService.selectDeptList();
		m.addAttribute("deptList", deptList);
		ArrayList<Project> prjList = rwService.selectProjectList(emp.getEmp_no());
		log.info("참여중 project 목록 : {}", prjList);
		m.addAttribute("prjList", prjList);
		
		
		
		
		return "requestwork/rwMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getDeptMember.do", produces = "application/text; charset=UTF-8")
	public String getDeptMember(String dept_code)throws Exception{
		log.info("부서 번호 : {}", dept_code);
		
		ArrayList<Employee> memberList = rwService.getDeptMember(Integer.parseInt(dept_code));
		
		log.info(dept_code+"부서의 인원 : "+memberList.toString());
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(memberList);
	}
	
	@RequestMapping("/insertRequestWork.do")
	public String insertRequestWork(RequestWork rw, @RequestParam(name="upload_file", required=false) MultipartFile file,
			HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		Map<String, String> msgMap = new HashMap<String, String>(); 
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("[로그인된 유저] : {}", emp.toString());
		
		String fileSeq = null;//null이 넣어지니까 
		if(!file.getOriginalFilename().equals("")) {//만약 받아온 파일이 비어 있어있지 않으면
			fileSeq = String.valueOf(fileService.uploadFile(file, request, "RW"));
			
			rw.setReq_file(fileSeq);
			
		}
		
		rw.setReq_member(String.valueOf(emp.getEmp_no()));
		
		int result = rwService.insertRequestWork(rw);
		log.info("업무신청서 결과 : {}", result);
		
		if(result > 0) {
			msgMap.put("msg", "업무가 성공적으로 요청됐습니다.");
			
			noticeService.insertNotice(emp, result, "RW");// 알림 insert
			
			
		}else {
			fileService.failed(Integer.parseInt(fileSeq));
			msgMap.put("msg", "업무 요청에 실패했습니다.");
			
		}
		redirect.addFlashAttribute("msg", msgMap);
		
		
		
		
		return "redirect:/requestWork/requestWorkMain.do";
	}
	

	@RequestMapping("/completedRequest.do")
	public String completedRequest() {
		
		return "requestwork/rwCompleted";
	}
	
	@RequestMapping("/allRequest.do")
	public String allRequest() {
		
		return "requestwork/rwAllList";
	}

}
