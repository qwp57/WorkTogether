package com.uni.wt.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.uni.wt.admin.model.dto.Department;
import com.uni.wt.approval.model.dto.Approval;
import com.uni.wt.approval.model.dto.ApprovalExpenditure;
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.approval.model.dto.ApprovalMMinutes;
import com.uni.wt.approval.model.dto.ApprovalSearchCondition;
import com.uni.wt.approval.model.service.ApprovalService;
import com.uni.wt.common.Pagination;
import com.uni.wt.common.commonFile.FileService;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.common.notice.service.NoticeService;
import com.uni.wt.employee.model.dto.Employee;

@Controller
public class ApprovalController {
	
	private static final Logger log = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private NoticeService noticeService;
	
	//전자결재 홈으로 이동
	@RequestMapping("/approvalMain.do")
	public String approvalMainPage(HttpServletRequest request, Model model) throws Exception {
		//로그인한 사람의 emp 정보를 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		int empNo = emp.getEmp_no();
		//기안 현황 
		//결재 대기
		int waitCount = approvalService.approvalWaitCount(empNo);
		//결재 완료
		int completeCount = approvalService.approvalCompleteCount(empNo);
		//결재 진행 중
		int proceedingCount = approvalService.approvalProceedingCount(empNo);
		
		//결재 문서 현황
		//새 결재 문서
		int newApprovalCount = approvalService.approvalNewCount(empNo);
		
		//내가 기안한 문서
		ArrayList<Approval> draftList = approvalService.mainDraftList(empNo);
		
		//나에게 온 결재 문서
		ArrayList<Approval> appList = approvalService.mainAppList(empNo);
		
		model.addAttribute("waitCount", waitCount);
		model.addAttribute("completeCount", completeCount);
		model.addAttribute("proceedingCount", proceedingCount);
		model.addAttribute("newApprovalCount", newApprovalCount);
		model.addAttribute("draftList", draftList);
		model.addAttribute("appList", appList);
		
		return "approval/approvalMainView";
	}
	
	//기안 문서함으로 이동
	@RequestMapping("/draftDocument.do")
	public String draftDocumentBoxPage(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model) throws Exception {
		//로그인한 사람의 emp 정보를 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		int listCount = approvalService.draftListCount(emp.getEmp_no());
		log.info("글 개수 : " + listCount);
		
		//페이지 정보를 가지고 있는 객체 생성
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		log.info("페이지 정보 : " + pi);
		
		//list 조회해오기
		ArrayList<Approval> draftList = approvalService.selectDraftList(emp.getEmp_no(), pi);
		
		model.addAttribute("draftList", draftList);
		model.addAttribute("pi", pi);
		
		return "approval/draftDocumentListView";
	}
	
	//기안 문서함 검색
	@RequestMapping("/searchDraft.do")
	public String draftSearchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model, 
								  String condition, String keyword, ApprovalSearchCondition asc, @RequestParam(value="sortCondition", required=false) String sortCondition) throws Exception {
		log.info("condition : " + condition);
		log.info("keyword : " + keyword);
		log.info("sortCondition : " + sortCondition);
		
		//로그인한 사람의 emp 정보를 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		//받아온 condition이 무엇이냐에 따라 set해준다.
		switch(condition) {
		case "title" :
			asc.setTitle(keyword);
			break;
		case "docName" :
			asc.setDocName(keyword);
			break;
		case "approvalNo" :
			asc.setApprovalNo(keyword);
			break;
		}
		log.info("asc에 담겨있는 condition : " + asc);
		
		//검색을 위한 페이징 처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("asc", asc);
		map.put("emp_no", emp.getEmp_no());
		map.put("sortCondition", sortCondition);		
		
		int listCount = approvalService.searchListCount(map);
		log.info("검색 페이지 글 수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Approval> draftList = approvalService.searchDraftList(map, pi);
		log.info("draftList : " + draftList);
		
		model.addAttribute("draftList", draftList);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("sortCondition", sortCondition);
		
		return "approval/draftDocumentListView";
	}
	
	//결재 문서함으로 이동
	@RequestMapping("/approvalDocument.do")
	public String approvalDocumentBoxPage(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model) throws Exception {
		//로그인한 사람 정보 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		//글 개수
		int listCount = approvalService.appListCount(emp.getEmp_no());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		//list 조회
		ArrayList<Approval> appList = approvalService.selectAppList(emp.getEmp_no(), pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("appList", appList);
		
		return "approval/approvalDocumentListView";
	}
	
	//결재 문서함 검색
	@RequestMapping("/searchApp.do")
	public String appSearchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model, 
								String condition, String keyword, ApprovalSearchCondition asc, @RequestParam(value="sortCondition", required=false) String sortCondition) throws Exception {
		//로그인한 사람 정보 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		//받아온 condition이 무엇이냐에 따라 set해준다.
		switch(condition) {
		case "title" :
			asc.setTitle(keyword);
			break;
		case "docName" :
			asc.setDocName(keyword);
			break;
		case "approvalNo" :
			asc.setApprovalNo(keyword);
			break;
		case "appName" :
			asc.setAppName(keyword);
			break;
		}
		
		//검색을 위한 페이징 처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("asc", asc);
		map.put("emp_no", emp.getEmp_no());
		map.put("sortCondition", sortCondition);
		
		int listCount = approvalService.searchAppListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		//list 조회
		ArrayList<Approval> appList = approvalService.searchAppList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("appList", appList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("sortCondition", sortCondition);
		
		return "approval/approvalDocumentListView";
	}
	
	//일반 품의서 작성폼으로 이동
	@RequestMapping("/letterOfApprovalEnrollForm.do")
	public String letterOfApprovalEnrollForm(HttpServletRequest request, Model model) throws Exception {		
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();
		//세션에 로그인한 유저 정보
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("emp", emp);
		
		log.info("deptList : " + deptList);
		log.info("empList : " + empList);
		log.info("emp: " + emp.toString());
		
		return "approval/letterOfApprovalEnrollForm";
	}
	
	//공통 문서 저장
	@RequestMapping("/insertApproval.do")
	public String insertApproval(Approval app, ApprovalLoa loa, ApprovalExpenditure appEx, ApprovalMMinutes appMm, @RequestParam(value="firstApproverNo") int firstApproverNo,
								@RequestParam(name="finalApp", required = false) String finalApp, @RequestParam(name="upfile", required = false) MultipartFile file, HttpServletRequest request, 
								@RequestParam(value="exDateList", required = false)List<String> exDateList, @RequestParam(value="exClassificationList", required = false)List<String> exClassificationList, 
								@RequestParam(value="amountList", required = false) List<String> amountList, @RequestParam(value="exHistoryList", required = false)List<String> exHistoryList, 
								@RequestParam(value="noteList", required = false)List<String> noteList) throws Exception {
		log.info("공통 문서 정보 Approval : " + app);
		log.info("최종결재자 : " + finalApp);
		log.info("지출결의서 : " + appEx);
		log.info("exDateList : " + exDateList);
		log.info("exClassificationList : " + exClassificationList);
		log.info("amountList : " + amountList);
		log.info("exHistoryList : " + exHistoryList);
		log.info("noteList : " + noteList);
		
		//첨부파일 등록
		//originalFileName이 전달되는 값이 없으면 빈문자열로 넘어온다.
		String fileNo = null; //return 되는 file_no를 넣기 위한 변수 
		if(!file.getOriginalFilename().equals("")) {
			//따로 만들어져 있는 fileService에 정보를 보내서 폴더 경로를 가져와서 어디에 저장할지 savePath지정, 파일 명도 새로 지정
			//-> 다른 문서 양식에서도 사용할 것임
			fileNo = String.valueOf(fileService.uploadFile(file, request, "AP"));
			
			app.setFileNo(Integer.parseInt(fileNo));
		}
		
		//양식 이름
		if(app.getDocNo() == 1) {
			app.setDocName("일반품의서");
		}else if(app.getDocNo() == 2) {
			app.setDocName("지출결의서");
		}else {
			app.setDocName("회의록");
		}
		
		//긴급 여부
		if(app.getEmergency() == null) {
			app.setEmergency("N");
		}
		
		//공통 양식 insert
		approvalService.insertApproval(app);

		log.info("insert 후 app : " + app);
		log.info("approvalNo : " + app.getApprovalNo());
		
		//최종 결재자 사번을 넣을 변수
		int finalApproverNo = 0;
		//최종 결재자가 있는지 확인
		if(!finalApp.equals("")) { //비어있지 않으면 최종 결재자가 존재하는 것이다.
			finalApproverNo = Integer.parseInt(finalApp);
		}
		log.info("최종결재자 사번 넣은 후 finalApproverNo : " + finalApproverNo);
		
		int result = 0; //등록 결과를 받을 result
		//기안서 양식에 맞워서 등록
		if(app.getDocNo() == 1) { //일반품의서인 경우
			result = insertLetterOfApproval(loa, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}else if(app.getDocNo() == 2) { //지출 결의서인 경우
			result = insertExpenditure(appEx, exDateList, exClassificationList, amountList, exHistoryList, noteList, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}else { //회의록인 경우
			result = insertMminutes(appMm, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}
		
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		if(result > 0) {			
			noticeService.insertNotice(firstApproverNo, finalApp, emp, app, "AP", request);
			
		}
		
		return "redirect:/draftDocument.do";
	}

	//일반 품의서 insert
	private int insertLetterOfApproval(ApprovalLoa loa, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {		
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
		
		//일반 품의서 insert
		loa.setApprovalNo(approvalNo);
		loa.setLineNo(lineNo);
		loa.setContent(loa.getContent().replace("\r\n", "<br>")); //개행
		int result = approvalService.insertLoa(loa);
		
		return result;
	}

	//결재선 등록 메소드
	private int insertApprovalLine(int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {		
		ApprovalLine appL = new ApprovalLine();
		appL.setApprovalNo(approvalNo);
		appL.setFirstApproverNo(firstApproverNo);
		log.info("최종결재자 사번  finalApproverNo : " + finalApproverNo);
		if(finalApproverNo == 0) {
			appL.setLineLevel(1);			
			approvalService.insertApprovalLine1(appL);
		}else {
			appL.setLineLevel(2);
			appL.setFinalApproverNo(finalApproverNo);
			approvalService.insertApprovalLine2(appL);
		}
		
		int lineNo = appL.getLineNo();
		return lineNo;
	}

	//지출 결의서 작성 폼으로 이동
	@RequestMapping("/expenditureEnrollForm.do")
	public String expenditureEnrollForm(HttpServletRequest request, Model model) throws Exception {		
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();
		//세션에 로그인한 유저 정보
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("emp", emp);
		
		log.info("deptList : " + deptList);
		log.info("empList : " + empList);
		log.info("emp: " + emp.toString());
		
		return "approval/expenditureEnrollForm";
	}
	
	//지출결의서 작성
	private int insertExpenditure(ApprovalExpenditure appEx, List<String> exDateList,
			List<String> exClassificationList, List<String> amountList, List<String> exHistoryList,
			List<String> noteList, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {
		
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
		
		//지출결의서에 insert
		appEx.setApprovalNo(approvalNo);
		appEx.setLineNo(lineNo);
		appEx.setExContent(appEx.getExContent().replace("\r\n", "<br>")); //개행
		
		String exDate = String.join(",", exDateList);
		appEx.setExDate(exDate);
		
		String exClassification = String.join(",", exClassificationList);
		appEx.setExClassification(exClassification);
		
		String amount = String.join(",", amountList);
		appEx.setAmount(amount); 
		
		String exHistory = String.join(",", exHistoryList);
		appEx.setExHistory(exHistory);
		
		String note = String.join(",", noteList);
		appEx.setNote(note);
		
		int result = approvalService.insertExpenditure(appEx);
		
		return result;
	}
	
	//회의록으로 이동
	@RequestMapping("/theMinutesOfAMeetingEnrollForm.do")
	public String theMinutesOfAMeetingForm(HttpServletRequest request, Model model) throws Exception {
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();
		//세션에 로그인한 유저 정보
		Employee emp = (Employee) request.getSession().getAttribute("loginEmp");
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		model.addAttribute("emp", emp);
		
		log.info("deptList : " + deptList);
		log.info("empList : " + empList);
		log.info("emp: " + emp.toString());
		
		return "approval/theMinutesOfAMeetingEnrollForm";
	}
	
	//회의록 insert
	private int insertMminutes(ApprovalMMinutes appMm, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
		
		//회의록에 insert
		appMm.setApprovalNo(approvalNo);
		appMm.setLineNo(lineNo);
		appMm.setMeetingPurpose(appMm.getMeetingPurpose().replace("\r\n", "<br>"));
		appMm.setMeetingContent(appMm.getMeetingContent().replace("\r\n", "<br>"));
		int result = approvalService.insertMminutes(appMm);
		
		return result;
	}
	
	//내 기안서 디테일로 이동
	@RequestMapping("/detailDraftDocument.do")
	public ModelAndView detailDraftDocument(String approvalNo, String docNo, Approval app, ApprovalLine appL, ApprovalLoa loa, ApprovalExpenditure appEx, ApprovalMMinutes appMm, ModelAndView mv) throws Exception {
		//형 변환
		int doc_no = Integer.parseInt(docNo);
		
		//문서 번호에 따라 디테일 메소드 이동
		if(doc_no == 1) { //일반 품의서인 경우
			Map<String, Object> map = selectMyLetterOfApproval(Integer.parseInt(approvalNo), app, appL, loa);
			mv.addObject("map", map).setViewName("approval/myLetterOfApprovalDetailView");
		}else if(doc_no == 2) {
			Map<String, Object> map = selectMyExpenditure(Integer.parseInt(approvalNo), app, appL, appEx);
			mv.addObject("map", map).setViewName("approval/myExpenditureDetailView");
		}else if(doc_no == 3) {
			Map<String, Object> map = selectMytheMinutesOfAMeeting(Integer.parseInt(approvalNo), app, appL, appMm);
			mv.addObject("map", map).setViewName("approval/myTheMinutesOfAMeetingDetailView");
		}

		return mv;
	}
	
	
	//일반 품의서 디테일로 이동
	public Map<String, Object> selectMyLetterOfApproval(int approvalNo, Approval app, ApprovalLine appL, ApprovalLoa loa) throws Exception {
		//공통 문서
		app = selectApproval(approvalNo, app);
		log.info("디테일 app : " + app);
		//결재선
		appL = selectApprovalLine(approvalNo, appL);
		log.info("디테일 appL : " + appL);
		//일반 품의서 내용 조회
		loa = approvalService.selectApprovalLoa(approvalNo);
		log.info("디테일 loa : " + loa);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("loa", loa);

		return map;
	}
	
	//공통 문서 조회
	private Approval selectApproval(int approvalNo, Approval app) throws Exception {
		
		app = approvalService.selectApproval(approvalNo);
		
		return app;
	}
	
	//결재선 조회
	private ApprovalLine selectApprovalLine(int approvalNo, ApprovalLine appL) throws Exception {
		
		appL = approvalService.selectApprovalLine(approvalNo);
		
		return appL;
	}

	//지출 결의서 디테일로 이동
	public Map<String, Object> selectMyExpenditure(int approvalNo, Approval app, ApprovalLine appL, ApprovalExpenditure appEx) throws Exception {
		//공통 문서
		app = selectApproval(approvalNo, app);
		log.info("디테일 app : " + app);
		//결재선
		appL = selectApprovalLine(approvalNo, appL);
		//지출 결의서 조회
		appEx = approvalService.selectApprovalExpenditure(approvalNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("appEx", appEx);
		
		return map;
	}
	
	//회의록 디테일로 이동
	public Map<String, Object> selectMytheMinutesOfAMeeting(int approvalNo, Approval app, ApprovalLine appL, ApprovalMMinutes appMm) throws Exception {
		//공통 문서
		app = selectApproval(approvalNo, app);
		log.info("디테일 app : " + app);
		//결재선
		appL = selectApprovalLine(approvalNo, appL);
		//회의록 조회
		appMm = approvalService.selectApprovaltheMinutesOfAMeeting(approvalNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("appMm", appMm);
		
		return map;
	}
	
	//일반 품의서 수정폼으로 이동
	@RequestMapping("/updateMyLetterOfApprovalForm.do")
	public String updateMyLetterOfApprovalForm(String approvalNo, Approval app, ApprovalLine appL, ApprovalLoa loa, Model model) throws Exception {
		//디테일 조회할 때 사용한 공통 문서 조회 메소드 사용
		app = selectApproval(Integer.parseInt(approvalNo), app);
		//디테일 조회할 때 사용한 공통 결재선 조회 메소드 사용
		appL = selectApprovalLine(Integer.parseInt(approvalNo), appL);
		//일반품의서 조회
		loa = approvalService.selectUpdateLoa(Integer.parseInt(approvalNo));
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();	 
		
		model.addAttribute("app", app);
		model.addAttribute("appL", appL);
		model.addAttribute("loa", loa);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "approval/myLetterOfApprovalUpdateForm";
	}
	
	//일반 품의서 수정
	@RequestMapping("/updateMyLetterOfApproval.do")
	public ModelAndView updateMyLetterOfApproval(Approval app, ApprovalLoa loa, @RequestParam(name="firstApproverNo") int firstApproverNo, @RequestParam(name="finalApp", required = false) String finalApp,
													@RequestParam(name="reUpfile" ,required=false) MultipartFile file, ModelAndView mv, HttpServletRequest request) throws Exception {
		log.info("업데이트 app : " + app);
		log.info("업데이트 loa : " + loa);
		log.info("업데이트 firstApproverNo : " + firstApproverNo);
		log.info("업데이트 finalApp : " + finalApp);
		log.info("업데이트 file : " + file);
		
		//첨부파일 -> 기존 첨부파일이 있으면 넘어온다.
		String orgChangeName = app.getChange_name();
		int orgFileNo = app.getFileNo();
		
		//새로 넘어온 reUploadFile의 originalFileName이 빈 문자열이 아닌 경우 -> 새로 등록된 파일이 있는 경우 
		String fileNo = null;
		if(!file.getOriginalFilename().equals("")) {
			fileNo = String.valueOf(fileService.uploadFile(file, request, "AP"));
			
			app.setFileNo(Integer.parseInt(fileNo));
		}
		
		if(app.getEmergency() == null) {
			app.setEmergency("N");
		}
		
		//공통 결재 업데이트
		updateApproval(app);
		
		//결재선 업데이트
		updateApprovalLine(app.getApprovalNo(), firstApproverNo, finalApp);
		
		//품의서 업데이트
		approvalService.updateLetterOfApproval(loa);
		
		//파일 삭제
		if(orgChangeName != null && !file.getOriginalFilename().equals("")) {
			fileService.deleteFile(String.valueOf(orgFileNo));
		}
		
		mv.addObject("approvalNo", app.getApprovalNo()).addObject("docNo", 1).setViewName("redirect:detailDraftDocument.do");
		return mv;
	}

	//공통 결재 업데이트
	private void updateApproval(Approval app) throws Exception {
		approvalService.updateApproval(app);
	}
	
	//결재선 업데이트
	private void updateApprovalLine(int approvalNo, int firstApproverNo, String finalApp) throws Exception {
		
		int finalApproverNo = 0;
		if(finalApp != null) {
			finalApproverNo = Integer.parseInt(finalApp);
		}
		
		//if(finalApp != null) { //최종 결재자가 있을 때
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("approvalNo", approvalNo);
			map.put("firstApproverNo", firstApproverNo);
			map.put("finalApproverNo", finalApproverNo);
			approvalService.updateApprovalLineLevel(map);
		/*}else { //최종 결재자 넘어오지 않거나, 최초 결재자만 변경
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("approvalNo", approvalNo);
			map.put("firstApproverNo", firstApproverNo);
			approvalService.updateApprovalLine(map);
		}*/
		
	}

	//지출 결의서 수정으로 이동
	@RequestMapping("/updateMyExpenditureForm.do")
	public String updateMyExpenditureForm(String approvalNo, Approval app, ApprovalLine appL, ApprovalExpenditure appEx, Model model) throws NumberFormatException, Exception {
		//디테일 조회할 때 사용한 공통 문서 조회 메소드 사용
		app = selectApproval(Integer.parseInt(approvalNo), app);
		//디테일 조회할 때 사용한 공통 결재선 조회 메소드 사용
		appL = selectApprovalLine(Integer.parseInt(approvalNo), appL);
		//일반품의서 조회
		appEx = approvalService.selectUpdateAppEx(Integer.parseInt(approvalNo));
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();	 
		
		model.addAttribute("app", app);
		model.addAttribute("appL", appL);
		model.addAttribute("appEx", appEx);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "approval/myExpenditureUpdateForm";
	}
	
	//지출 결의서 수정
	@RequestMapping("/updateMyExpenditure.do")
	public ModelAndView updateMyExpenditure(Approval app, ApprovalExpenditure appEx, @RequestParam(name="firstApproverNo") int firstApproverNo, @RequestParam(name="finalApp", required = false) String finalApp, @RequestParam(name="reUpfile" ,required=false) MultipartFile file, 
											@RequestParam(value="exDateList", required = false)List<String> exDateList, @RequestParam(value="exClassificationList", required = false)List<String> exClassificationList, @RequestParam(value="amountList", required = false) List<String> amountList, 
											@RequestParam(value="exHistoryList", required = false)List<String> exHistoryList, @RequestParam(value="noteList", required = false)List<String> noteList, ModelAndView mv, HttpServletRequest request) throws Exception	{
		log.info("업데이트 app : " + app);
		log.info("업데이트 appEx : " + appEx);
		log.info("업데이트 firstApproverNo : " + firstApproverNo);
		log.info("업데이트 finalApp : " + finalApp);
		log.info("업데이트 file : " + file);
		log.info("exDateList : " + exDateList);
		log.info("exClassificationList : " + exClassificationList);
		log.info("amountList : " + amountList);
		log.info("exHistoryList : " + exHistoryList);
		log.info("noteList : " + noteList);
		//첨부파일 -> 기존 첨부파일이 있으면 넘어온다.
		String orgChangeName = app.getChange_name();
		int orgFileNo = app.getFileNo();
		
		//새로 넘어온 reUploadFile의 originalFileName이 빈 문자열이 아닌 경우 -> 새로 등록된 파일이 있는 경우 
		String fileNo = null;
		if(!file.getOriginalFilename().equals("")) {
			fileNo = String.valueOf(fileService.uploadFile(file, request, "AP"));
			
			app.setFileNo(Integer.parseInt(fileNo));
		}
		
		if(app.getEmergency() == null) {
			app.setEmergency("N");
		}
		
		//공통 결재 업데이트
		updateApproval(app);
		
		//결재선 업데이트
		updateApprovalLine(app.getApprovalNo(), firstApproverNo, finalApp);
		
		//지출 결의서 업데이트
		String exDate = String.join(",", exDateList);
		appEx.setExDate(exDate);
		
		String exClassification = String.join(",", exClassificationList);
		appEx.setExClassification(exClassification);
		
		String amount = String.join(",", amountList);
		appEx.setAmount(amount); 
		
		String exHistory = String.join(",", exHistoryList);
		appEx.setExHistory(exHistory);
		
		String note = String.join(",", noteList);
		appEx.setNote(note);
		
		approvalService.updateExpenditure(appEx);
		
		//파일 삭제
		if(orgChangeName != null && !file.getOriginalFilename().equals("")) {
			fileService.deleteFile(String.valueOf(orgFileNo));
		}
		
		mv.addObject("approvalNo", app.getApprovalNo()).addObject("docNo", 2).setViewName("redirect:detailDraftDocument.do");
		return mv;
	}
		
	//회의록 수정폼으로 이동
	@RequestMapping("/updateMyTheMinutesOfAMeetingForm.do")
	public String updateMyTheMinutesOfAMeetingForm(String approvalNo, Approval app, ApprovalLine appL, ApprovalMMinutes appMm, Model model) throws Exception {
		//디테일 조회할 때 사용한 공통 문서 조회 메소드 사용
		app = selectApproval(Integer.parseInt(approvalNo), app);
		//디테일 조회할 때 사용한 공통 결재선 조회 메소드 사용
		appL = selectApprovalLine(Integer.parseInt(approvalNo), appL);
		//일반품의서 조회
		appMm = approvalService.selectUpdateAppMm(Integer.parseInt(approvalNo));
		//부서 조회
		ArrayList<Department> deptList = approvalService.selectDeptList();		
		//사원 조회
		ArrayList<Employee> empList= approvalService.selectEmpList();	 
		
		model.addAttribute("app", app);
		model.addAttribute("appL", appL);
		model.addAttribute("appMm", appMm);
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
				
		return "approval/myTheMinutesOfAMeetingUpdateForm";
	}
	
	@RequestMapping("/updateMyTheMinutesOfAMeeting.do")
	public ModelAndView updateMyTheMinutesOfAMeeting(Approval app, ApprovalMMinutes appMm, @RequestParam(name="firstApproverNo") int firstApproverNo, @RequestParam(name="finalApp", required = false) String finalApp,
													@RequestParam(name="reUpfile" ,required=false) MultipartFile file, ModelAndView mv, HttpServletRequest request) throws Exception {
		log.info("업데이트 app : " + app);
		log.info("업데이트 appEx : " + appMm);
		log.info("업데이트 firstApproverNo : " + firstApproverNo);
		log.info("업데이트 finalApp : " + finalApp);
		log.info("업데이트 file : " + file);
		
		String orgChangeName = app.getChange_name();
		int orgFileNo = app.getFileNo();
		
		//새로 넘어온 reUploadFile의 originalFileName이 빈 문자열이 아닌 경우 -> 새로 등록된 파일이 있는 경우 
		String fileNo = null;
		if(!file.getOriginalFilename().equals("")) {
			fileNo = String.valueOf(fileService.uploadFile(file, request, "AP"));
			
			app.setFileNo(Integer.parseInt(fileNo));
		}
		
		if(app.getEmergency() == null) {
			app.setEmergency("N");
		}
		
		//공통 결재 업데이트
		updateApproval(app);
		
		//결재선 업데이트
		updateApprovalLine(app.getApprovalNo(), firstApproverNo, finalApp);
		
		//회의록 업데이트
		approvalService.updateTheMinutesOfAMeeting(appMm);
		
		//첨부파일 삭제
		if(orgChangeName != null && !file.getOriginalFilename().equals("")) {
			fileService.deleteFile(String.valueOf(orgFileNo));
		}
		
		mv.addObject("approvalNo", app.getApprovalNo()).addObject("docNo", 3).setViewName("redirect:detailDraftDocument.do");
		return mv;
	}
	
	//공통 결재 디테일 조회
	@RequestMapping("/detailApproval.do")
	public ModelAndView detailApproval(String approvalNo, String docNo, Approval app, ApprovalLine appL, ApprovalLoa loa, ApprovalExpenditure appEx, ApprovalMMinutes appMm, ModelAndView mv, HttpServletRequest request) throws Exception {
		//결재 
		int doc_no = Integer.parseInt(docNo);
		
		if(doc_no == 1) { //일반 품의서 디테일로 이동
			Map<String, Object> map = selectAppLetterOfApproval(Integer.parseInt(approvalNo), app, appL, loa, request);
			mv.addObject("map", map).setViewName("approval/appLetterOfApprovalDetailView");
		}else if(doc_no == 2) {
			Map<String, Object> map = selectAppExpenditure(Integer.parseInt(approvalNo), app, appL, appEx, request);
			mv.addObject("map", map).setViewName("approval/appExpenditureDetailView");
		}else if(doc_no == 3) {
			Map<String, Object> map = selectApptheMinutesOfAMeeting(Integer.parseInt(approvalNo), app, appL, appMm, request);
			mv.addObject("map", map).setViewName("approval/appTheMinutesOfAMeetingDetailView");
		}
		
		return mv;
	}
	
	//일반 품의서 결재 디테일로 이동
	public Map<String, Object> selectAppLetterOfApproval(int approvalNo, Approval app, ApprovalLine appL, ApprovalLoa loa, HttpServletRequest request) throws Exception {
		//공통문서 조회
		app = selectApproval(approvalNo, app);
		
		//결재선 조회
		appL = selectApprovalLine(approvalNo, appL);
		
		//일반 품의서 결재 디테일
		loa = approvalService.selectApprovalLoa(approvalNo);
		
		//로그인한 사람
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		int emp_no = emp.getEmp_no();
    
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("loa", loa);
		map.put("emp_no", emp_no);	
		
		return map;
	}


	//지출 결의서 결재 디테일로 이동
	public Map<String, Object> selectAppExpenditure(int approvalNo, Approval app, ApprovalLine appL, ApprovalExpenditure appEx, HttpServletRequest request) throws Exception {
		//공통문서 조회
		app = selectApproval(approvalNo, app);
		
		//결재선 조회
		appL = selectApprovalLine(approvalNo, appL);
		
		//지출 결의서 결재 디테일
		appEx = approvalService.selectApprovalExpenditure(approvalNo);
		
		//로그인한 사람
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		int emp_no = emp.getEmp_no();
		log.info("지출결의서 결재 emp_no : " + emp_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("appEx", appEx);
		map.put("emp_no", emp_no);		
		
		return map;
	}
	
	//회의록 결재 디테일로 이동
	public Map<String, Object> selectApptheMinutesOfAMeeting(int approvalNo, Approval app, ApprovalLine appL, ApprovalMMinutes appMm, HttpServletRequest request) throws Exception {
		//공통문서 조회
		app = selectApproval(approvalNo, app);
		
		//결재선 조회
		appL = selectApprovalLine(approvalNo, appL);
		
		//회의록 결재 디테일
		appMm = approvalService.selectApprovaltheMinutesOfAMeeting(approvalNo);
		
		//로그인한 사람
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		int emp_no = emp.getEmp_no();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("app", app);
		map.put("appL", appL);
		map.put("appMm", appMm);	
		map.put("emp_no", emp_no);		
		
		return map;
	}
	
	//결재 상태 업데이트 -> 승인
	@RequestMapping("/approvalUpdate.do")
	public String approvalUpdate(@RequestParam(value="firstApproverNo", required = false) String firstApproverNo, @RequestParam(value="finalApproverNo", required=false) String finalApproverNo, String approvalNo, String lineLevel) throws Exception {
		log.info("지출결의서 결재 firstApproverNo : " + firstApproverNo);
		log.info("지출결의서 결재 finalApproverNo : " + finalApproverNo);
		log.info("지출결의서 결재 approvalNo : " + approvalNo);
		log.info("지출결의서 결재 lineLevel : " + lineLevel);
		
		//문서번호 
		int approval_no = Integer.parseInt(approvalNo);		
		
		//firstApprovalNo가 넘어왔는지 finalApprovalNo가 넘어왔는지 확인
		if(firstApproverNo != null && finalApproverNo == null) { //최초 결재자
			//최초 결재자
			int firstApprover_no = Integer.parseInt(firstApproverNo);		
			if(Integer.parseInt(lineLevel) == 1) { //최초 결재자에서 lineLevel이 1인지 2인지 확인
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("arppvoalNo", approval_no);
				map.put("firstApproverNo", firstApprover_no);
				//결재선 업데이트
				approvalService.updateAppLineLevelOneFirstApprover(map);
				//결재 업데이트
				approvalService.updateAppLevelOneFirstApprover(approval_no);
			}else { //lineLevel이 2인 최초 결재자 -> 결재 상태를 P(진행 중)으로 변경
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("arppvoalNo", approval_no);
				map.put("firstApproverNo", firstApprover_no);
				//결재선 업데이트
				approvalService.updateAppLineLevelTwoFirstApprover(map);
				//결재 업데이트
				approvalService.updateAppLevelTwoFirstApprover(approval_no);
			}			
		}else if(finalApproverNo != null && firstApproverNo == null) { //최종 결재자 -> 최종 결재자가 있다면 무조건 level2이기 때문에 확인할 필요 없음
			int finalApprover_no = Integer.parseInt(finalApproverNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("arppvoalNo", approval_no);
			map.put("finalApproverNo", finalApprover_no);
			//결재선 업데이트
			approvalService.updateAppLineLevelTwoFinalApprover(map);
			//결재 업데이트
			approvalService.updateAppLevelTwoFinalApprover(approval_no);
		}
		
		return "redirect:approvalDocument.do";
	}
	
	//결재 상태 업데이트 -> 반려
	@RequestMapping("/rejectionUpdate.do")
	public String rejectionUpdate(@RequestParam(value="firstApproverNo", required = false) String firstApproverNo, @RequestParam(value="finalApproverNo", required=false) String finalApproverNo, String approvalNo, String lineLevel, String rejectionReason) throws Exception {
		log.info(rejectionReason);
		
		//문서번호 
		int approval_no = Integer.parseInt(approvalNo);
		
		if(firstApproverNo != null && finalApproverNo == null) { //최초 결재자인 경우
			//최초 결재자 번호
			int firstApprover_no = Integer.parseInt(firstApproverNo);	
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("arppvoalNo", approval_no); //문서 번호
			map.put("firstApproverNo", firstApprover_no); //첫번째 결재자
			map.put("rejectionReason", rejectionReason); 
			//결재선 업데이트
			approvalService.updateRejectLineFirstApprover(map);
			//결재 문서 업데이트
			approvalService.updateRejectFirstApprover(approval_no);
			
		}else if(finalApproverNo != null && firstApproverNo == null) {
			int finalApprover_no = Integer.parseInt(finalApproverNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("arppvoalNo", approval_no);
			map.put("finalApproverNo", finalApprover_no);
			map.put("rejectionReason", rejectionReason); 
			//결재선 업데이트
			approvalService.updateRejectLineFinalApprover(map);
			//결재 문서 업데이트
			approvalService.updateRejectFinalApprover(approval_no);
		}
		
		return "redirect:approvalDocument.do";
	}
	
	@RequestMapping("/deleteApproval.do")
	public String deleteApproval(String approvalNo, String docNo, @RequestParam(value="fileNo", required=false) int fileNo) throws Exception {
		log.info("삭제 fileNo : " + fileNo);
		
		//첨부파일 삭제
		if(fileNo != 0) {	
			String file_no = String.valueOf(fileNo);
			fileService.deleteFile(file_no);
		}
		
		//문서 삭제
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("docNo", Integer.parseInt(docNo));
		map.put("approvalNo", Integer.parseInt(approvalNo));
		approvalService.deleteDocument(map);
		
		//결재 라인 삭제
		approvalService.deleteApprovalLine(Integer.parseInt(approvalNo));
		
		//기안서 삭제
		approvalService.deleteApproval(Integer.parseInt(approvalNo));			
		
		return "redirect:draftDocument.do";
	}
	
	//정렬
	//기안 문서함 진행 list
	@RequestMapping("/draftWaitingList.do")
	public String draftWaitingList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model) throws Exception {
		//로그인한 사람의 emp 정보를 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		int listCount = approvalService.draftWaitingListCount(emp.getEmp_no());
		log.info("글 개수 : " + listCount);
		
		//페이지 정보를 가지고 있는 객체 생성
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		log.info("페이지 정보 : " + pi);
		
		//list 조회해오기
		ArrayList<Approval> draftList = approvalService.selectDraftWaitingList(emp.getEmp_no(), pi);
		
		model.addAttribute("draftList", draftList);
		model.addAttribute("pi", pi);
		
		return "approval/draftDocumentListView"; 
	}
}
