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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.commonFile.FileService;
import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.requestWork.model.dto.RequestWork;
import com.uni.wt.requestWork.model.service.RequestService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RequestWorkController {
	
	@Autowired
	private RequestService rwService;
	
	@Autowired
	private FileService fileService;
	
//	@Autowired
//	private EchoHandler echoHandler;
	
	@Autowired
	private NoticeService noticeService;
	
	private Map<String, Object> param = new HashMap<String, Object>(); 
	
	
	@RequestMapping("/requestWorkMain.do")
	public String requestWorkMain(HttpServletRequest request, Model m) throws Exception {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap != null) {
			RequestWork r = (RequestWork)flashMap.get("r");
			Map<String, String> msgMap = (Map<String, String>) flashMap.get("msg");
			
			if(msgMap != null) {
				m.addAttribute("msg", msgMap.get("msg"));
				
			}
			
			m.addAttribute("r", r);
		}
		
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info(emp.toString());
		ArrayList<Object> deptList = rwService.selectDeptList();
		m.addAttribute("deptList", deptList);
		ArrayList<Project> prjList = rwService.selectProjectList(emp.getEmp_no());
		log.info("????????? project ?????? : {}", prjList);
		m.addAttribute("prjList", prjList);
		
		///////???????????? ????????? 
		
		// ??? ??????????????? ?????? ???????????? ????????????
		Map<String, Object> cnt = rwService.selectCountRw(emp.getEmp_no());
		if(cnt != null) {
			
			m.addAttribute("RQ", cnt.get("RQ"));
			m.addAttribute("P", cnt.get("P"));
		}
		
		///????????? ?????? ?????? 
		Map<String, Object> reqmap = requestList(emp.getEmp_no(), 1, "");
		//???????????? ?????? ?????? 
		Map<String, Object> resmap = responsList(emp.getEmp_no(), 1, "");
		
		//?????????
		m.addAttribute("reqList", reqmap.get("list"));
		m.addAttribute("reqpi", reqmap.get("pi"));
		
		//?????????
		m.addAttribute("resList", resmap.get("list"));
		m.addAttribute("respi", resmap.get("pi"));
		
		
		
		
		
		
		return "requestwork/rwMain";
	}
	
	@RequestMapping("/selectRWDetail_Notice.do")
	public String selectRWDetail_Notice(String rno,  RedirectAttributes redirect)throws Exception {
		log.info("?????? ?????? ??? ?????? ??????");
		RequestWork r = rwService.selectRWDetail(rno);
		r.setContent(r.getContent().replaceAll("\n", "<br>"));
		redirect.addFlashAttribute("r", r);
		
		
		return "redirect:/requestWorkMain.do";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectRQList.do" , produces = "application/text; charset=UTF-8")
	public String selectRQList(String sortVal, int currentPage, HttpServletRequest request) throws Exception{
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("?????? : " +sortVal);
		log.info("?????? ????????? : "+currentPage+"");
		log.info(emp.toString());
		
		Map<String, Object> map = requestList(emp.getEmp_no(), currentPage, sortVal);
		
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectRSList.do" , produces = "application/text; charset=UTF-8")
	public String selectRSList(String sortVal, int currentPage, HttpServletRequest request) throws Exception{
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("?????? : " +sortVal);
		log.info("?????? ????????? : "+currentPage+"");
		log.info(emp.toString());
		
		Map<String, Object> map = responsList(emp.getEmp_no(), currentPage, sortVal);
		
		
		return new Gson().toJson(map);
	}
	
	//?????? ????????? ?????? ?????????
	private Map<String, Object> responsList(int emp_no, int currentPage, String sortVal) throws Exception {
		//????????? ?????? ????????? ?????? ??????
		int listCount = rwService.getListCount(emp_no, "RS");
		log.info("[?????????????????? ????????? ??????] : {}", listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<RequestWork> list = rwService.selectRSList(emp_no, pi, sortVal);
		log.info("[?????????????????? ?????????] : {}", list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pi", pi);

		return map;
	}
	//?????? ????????? ?????? ????????? 
	private Map<String, Object> requestList(int emp_no, int currentPage, String sortVal) throws Exception {
		//??????????????? ????????? ?????? ??????
		int listCount = rwService.getListCount(emp_no, "RQ");
		log.info("[??????????????? ????????? ??????] : {}", listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<RequestWork> list = rwService.selectRQList(emp_no, pi, sortVal);
		log.info("[????????? ?????? ?????????] : {}", list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/getDeptMember.do", produces = "application/text; charset=UTF-8")
	public String getDeptMember(String dept_code, HttpServletRequest request)throws Exception{
		log.info("?????? ?????? : {}", dept_code);
		int emp_no = ((Employee)request.getSession().getAttribute("loginEmp")).getEmp_no();
		
		ArrayList<Employee> memberList = rwService.getDeptMember(Integer.parseInt(dept_code), emp_no);
		
		log.info(dept_code+"????????? ?????? : "+memberList.toString());
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(memberList);
	}
	
	@RequestMapping("/insertRequestWork.do")
	public String insertRequestWork(RequestWork rw, @RequestParam(name="upload_file", required=false) MultipartFile file,
					HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		Map<String, String> msgMap = new HashMap<String, String>(); 
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("[???????????? ??????] : {}", emp.toString());
		
		if(rw.getPj_no().equals("0")) {//????????? ???????????? ????????? 0????????? 
			rw.setPj_no(null);//???????????? ??????
		}
		
		String fileSeq = null;//null??? ??????????????? 
		if(!file.getOriginalFilename().equals("")) {//?????? ????????? ????????? ?????? ???????????? ?????????
			fileSeq = String.valueOf(fileService.uploadFile(file, request, "RW"));
			
			rw.setReq_file(fileSeq);
			
		}
		
		rw.setReq_member(String.valueOf(emp.getEmp_no()));
		
		int result = rwService.insertRequestWork(rw);
		log.info("??????????????? ?????? : {}", result);
		
		if(result > 0) {
			msgMap.put("msg", "????????? ??????????????? ??????????????????.");
			
			noticeService.insertNotice(emp, result, "RW", request);// ?????? insert
			
			
		}else {
			fileService.failed(Integer.parseInt(fileSeq));
			msgMap.put("msg", "?????? ????????? ??????????????????.");
			
		}
		redirect.addFlashAttribute("msg", msgMap);
		
		
		
		
		return "redirect:/requestWorkMain.do";
	}
	

	@ResponseBody
	@RequestMapping(value="/selectRWDetail.do", produces="application/text; charset=UTF-8")
	public String selectRWDetail(String rw_no) throws Exception {
		
		RequestWork detail = rwService.selectRWDetail(rw_no);
		detail.setContent(detail.getContent().replaceAll("\n", "<br>"));
		
		return new Gson().toJson(detail);
		
	}
	
	@RequestMapping("/cancleRW.do")//????????? ???????????? ?????????
	public String cancleRW(RequestWork rw) throws Exception {
		log.info(rw.toString());
		
		rwService.cancleRW(rw);
		
		return "redirect:/requestWorkMain.do";
	}
	
	@RequestMapping("/updateRW.do")
	public String updateRW(RequestWork rw, @RequestParam(name="upload_file", required=false) MultipartFile file,
							HttpServletRequest request) throws Exception{
		log.info(rw.toString());
		
		
		if(!rw.getRes_file().equals("") && !file.getOriginalFilename().equals("")) {//????????? ??????????????????
			
			fileService.deleteFile(rw.getRes_file());

			}
		
		if(!file.getOriginalFilename().equals("")) {//?????? ????????? ????????? ?????????
			String fileSeq = String.valueOf(fileService.uploadFile(file, request, "RW"));
			
			rw.setRes_file(fileSeq);
		}else if(rw.getRes_file().equals("")) {//?????? ????????? ????????? ????????? ?????? ????????? ????????? 
			rw.setRes_file(null);
		}//?????? ?????? ????????? ????????? ?????? jsp?????? ????????? ?????? ?????? ????????? ????????????. 
		
		
		
		rwService.updateRW(rw);
		
		return "redirect:/requestWorkMain.do";
	}
	
	@RequestMapping("/deleteRW.do")
	public String deleteRW(String rw_no) throws Exception {
		
		rwService.deleteRW(Integer.parseInt(rw_no));
		
		return"redirect:/requestWorkMain.do"; 
	}
	
	
	
	
	@RequestMapping("/completedRequest.do")
	public String completedRequest(Model m, HttpServletRequest request, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			 String type, SearchDto sd, String sort) throws Exception {
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		log.info("[???????????? ??????] : {}", emp.toString());
		log.info("[currentPage ] : {}", currentPage);
		log.info("[type ] : {}", type);
		log.info("[SearchDto ] : {}", sd.toString());
		log.info("sort : {}", sort);
	
		
	
		int listCount = rwService.getCompleteListCount(emp.getEmp_no(), type, sd);
		
		log.info("[listcount] : {}", listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<RequestWork> list = rwService.completeRequest(emp.getEmp_no(), type, sd, pi, sort);
		log.info(list.toString());
		
		m.addAttribute("sd", sd);
		m.addAttribute("type", type);
		m.addAttribute("sort", sort);
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "requestwork/rwCompleted";
	}
	
	@ResponseBody
	@RequestMapping("/deleteAjax.do")
	public String deleteAjax(int rw_no) throws Exception {
		
		rwService.deleteRW(rw_no);
		
		return "success";
	}
	
	
	@RequestMapping("/allRequest.do")
	public String allRequest(HttpServletRequest request,Model m, SearchDto sd ) throws Exception {
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("????????? ?????? : {}", sd.toString());
		
		int listCount = rwService.getAllListCount(emp.getEmp_no(), new RequestWork(), sd);
		log.info("?????? ???????????? ?????? : {}", listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, 1, 5, 10);
		
		ArrayList<RequestWork> list = rwService.selectAllList(emp.getEmp_no(), new RequestWork(), sd, "", pi);
		log.info("[?????? ?????? ?????????] : {}", list.toString());
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		m.addAttribute("sd", sd);
		
		
		return "requestwork/rwAllList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchOptionAllList.do", produces = "application/text; charset=UTF-8")
	public String searchOptionAllList(HttpServletRequest request, RequestWork rw, SearchDto sd, String sort, int currentPage) throws Exception {
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		log.info("????????? ?????? : {}", sd.toString());
		
		log.info("rw[type : "+rw.getType()+ "\n important : "+rw.getImportant()+"\n status : "+ rw.getStatus());
		log.info("SearchDto : {}", sd.toString());
		log.info("sort : {}", sort);
		
		int listCount = rwService.getAllListCount(emp.getEmp_no(), rw, sd);
		log.info("?????? ???????????? ?????? : {}", listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<RequestWork> list = rwService.selectAllList(emp.getEmp_no(), rw, sd, sort, pi);
		log.info("[?????? ?????? ?????????] : {}", list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		map.put("sd", sd);
		map.put("sort", sort);
		map.put("rw", rw);
		
		
		
		return new Gson().toJson(map);
	}
	
	
	
	
	
	
	
	
	

}
