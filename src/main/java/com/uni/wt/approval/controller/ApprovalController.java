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
import com.uni.wt.employee.model.dto.Employee;

@Controller
public class ApprovalController {
	
	private static final Logger log = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private FileService fileService;
	
	//전자결재 홈으로 이동
	@RequestMapping("approvalMain.do")
	public String approvalMainPage() {
		return "approval/approvalMainView";
	}
	
	//기안 문서함으로 이동
	@RequestMapping("draftDocument.do")
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
	@RequestMapping("searchDraft.do")
	public String draftSearchList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model, 
								  String condition, String keyword, ApprovalSearchCondition asc) throws Exception {
		log.info("condition : " + condition);
		log.info("keyword : " + keyword);
		
		//로그인한 사람의 emp 정보를 가지고 온다.
		Employee emp = (Employee)request.getSession().getAttribute("loginEmp");
		
		//받아온 condition이 무엇이냐에 따라 set해준다.
		switch(condition) {
		case "title" :
			asc.setTitle(keyword);
			break;
		case "docName" :
			asc.setTitle(keyword);
			break;
		case "approvalNo" :
			asc.setTitle(keyword);
			break;
		}
		log.info("asc에 담겨있는 condition : " + asc);
		
		//검색을 위한 페이징 처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("asc", asc);
		map.put("emp_no", emp.getEmp_no());
		
		int listCount = approvalService.searchListCount(map);
		log.info("검색 페이지 글 수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Approval> draftList = approvalService.searchDraftList(map, pi);
		
		model.addAttribute("draftList", draftList);
		model.addAttribute("pi", pi);
		
		return "approval/draftDocumentListView";
	}
	
	//결재 문서함으로 이동
	@RequestMapping("approvalDocument.do")
	public String approvalDocumentBoxPage(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request, Model model) {
		
		
		
		return "approval/approvalDocumentListView";
	}
	
	//일반 품의서 작성폼으로 이동
	@RequestMapping("letterOfApprovalEnrollForm.do")
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
	@RequestMapping("insertApproval.do")
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
			fileNo = String.valueOf(fileService.uploadFile(file, request, "APP"));
			
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
		if(app.getEmergency() == null) { //비어있으면 체크하지 않은 것 -> 빈 값이 넘어온다.
			app.setEmergency("N");
		} else {
			app.setEmergency("Y");
		}
		
		//if(app.getEmergency().equals("Y") { //비어있으면 체크하지 않은 것 -> 빈 값이 넘어온다.
		//	app.setEmergency("Y");
		//} else {
		//	app.setEmergency("N");
		//}
		log.info("app.getEmergency: " + app.getEmergency());
		
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
				
		//기안서 양식에 맞워서 등록
		if(app.getDocNo() == 1) { //일반품의서인 경우
			insertLetterOfApproval(loa, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}else if(app.getDocNo() == 2) { //지출 결의서인 경우
			insertExpenditure(appEx, exDateList, exClassificationList, amountList, exHistoryList, noteList, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}else { //회의록인 경우
			insertMminutes(appMm, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}
		
		return "redirect:/draftDocument.do";
	}

	//일반 품의서 insert
	private void insertLetterOfApproval(ApprovalLoa loa, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {		
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
		
		//일반 품의서 insert
		loa.setApprovalNo(approvalNo);
		loa.setLineNo(lineNo);
		loa.setContent(loa.getContent().replace("\r\n", "<br>")); //개행
		approvalService.insertLoa(loa);
	
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
	@RequestMapping("expenditureEnrollForm.do")
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
	private void insertExpenditure(ApprovalExpenditure appEx, List<String> exDateList,
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
		
		approvalService.insertExpenditure(appEx);
		
	}
	
	//회의록으로 이동
	@RequestMapping("theMinutesOfAMeetingEnrollForm.do")
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
	private void insertMminutes(ApprovalMMinutes appMm, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
		
		//회의록에 insert
		appMm.setApprovalNo(approvalNo);
		appMm.setLineNo(lineNo);
		appMm.setMeetingPurpose(appMm.getMeetingPurpose().replace("\r\n", "<br>"));
		appMm.setMeetingContent(appMm.getMeetingContent().replace("\r\n", "<br>"));
		approvalService.insertMminutes(appMm);
	}
	
	//일반 품의서 디테일로 이동
	@RequestMapping("myDetailLetterOfApproval.do")
	public String selectMyLetterOfApproval() {
		return "approval/myLetterOfApprovalDetailView";
	}
	
	//지출 결의서 디테일로 이동
	@RequestMapping("myDetailExpenditure.do")
	public String selectMyExpenditure() {
		return "approval/myExpenditureDetailView";
	}
	
	//회의록 디테일로 이동
	@RequestMapping("myDetailtheMinutesOfAMeeting.do")
	public String selectMytheMinutesOfAMeeting() {
		return "approval/myTheMinutesOfAMeetingDetailView";
	}
	
	//일반 품의서 수정으로 이동
	@RequestMapping("updateMyLetterOfApproval.do")
	public String updateMyLetterOfApprovalForm() {
		return "approval/myLetterOfApprovalUpdateForm";
	}
	
	//지출 결의서 수정으로 이동
	@RequestMapping("updateMyExpenditure.do")
	public String updateMyExpenditureForm() {
		return "approval/myExpenditureUpdateForm";
	}
	
	//회의록 수정으로 이동
	@RequestMapping("updateMyTheMinutesOfAMeeting.do")
	public String updateMyTheMinutesOfAMeetingForm() {
		return "approval/myTheMinutesOfAMeetingUpdateForm";
	}
	
	//일반 품의서 결재 디테일로 이동
	@RequestMapping("appDetailLetterOfApproval.do")
	public String selectAppLetterOfApproval() {
		return "approval/appLetterOfApprovalDetailView";
	}
	
	//지출 결의서 결재 디테일로 이동
	@RequestMapping("appDetailExpenditure.do")
	public String selectAppExpenditure() {
		return "approval/appExpenditureDetailView";
	}
	
	//회의록 결재 디테일로 이동
	@RequestMapping("appDetailtheMinutesOfAMeeting.do")
	public String selectApptheMinutesOfAMeeting() {
		return "approval/appTheMinutesOfAMeetingDetailView";
	}
}
