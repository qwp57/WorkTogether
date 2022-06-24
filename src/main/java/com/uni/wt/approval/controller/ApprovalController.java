package com.uni.wt.approval.controller;

import java.util.ArrayList;

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
import com.uni.wt.approval.model.dto.ApprovalLine;
import com.uni.wt.approval.model.dto.ApprovalLoa;
import com.uni.wt.approval.model.service.ApprovalService;
import com.uni.wt.common.commonFile.FileService;
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
	public String draftDocumentBoxPage() {
		return "approval/draftDocumentListView";
	}
	
	//결재 문서함으로 이동
	@RequestMapping("approvalDocument.do")
	public String approvalDocumentBoxPage() {
		return "approval/approvalDocumentListView";
	}
	
	//일반 품의서 작성으로 이동
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
	public void insertApproval(Approval app, @RequestParam(name="content") String content, @RequestParam(value="firstApproverNo") int firstApproverNo, @RequestParam(value="finalApp", required = false) String finalApp,
								@RequestParam(name="upfile", required = false) MultipartFile file, HttpServletRequest request) throws Exception {
		log.info("공통 문서 정보 Approval : " + app);
		
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
		}
		log.info("공통 양식 insert 전 : " + app);
		
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
		
		//기안서 양식에 맞워서 등록
		if(app.getDocNo() == 1) { //일반품의서인 경우
			insertLetterOfApproval(content, app.getApprovalNo(), firstApproverNo, finalApproverNo);
		}else if(app.getDocNo() == 2) { //지출 결의서인 경우
			
		}else { //회의록인 경우
			
		}
		
	}
	
	//일반 품의서 insert
	private String insertLetterOfApproval(String content, int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {		
		//결재선 insert
		int lineNo = insertApprovalLine(approvalNo, firstApproverNo, finalApproverNo);
			
		//일반 품의서 insert
		ApprovalLoa loa = new ApprovalLoa();
		loa.setApprovalNo(approvalNo);
		loa.setContent(content);
		loa.setLineNo(lineNo);
		approvalService.insertLoa(loa);
		
		return "redirect:draftDocument.do";
	}

	//결재선 등록 메소드
	private int insertApprovalLine(int approvalNo, int firstApproverNo, int finalApproverNo) throws Exception {		
		ApprovalLine appL = new ApprovalLine();
		appL.setApprovalNo(approvalNo);
		appL.setFirstApproverNo(firstApproverNo);
		
		if(finalApproverNo == 0) {
			appL.setLineLevel(1);			
			approvalService.insertApprovalLine1(appL);
		}else {
			appL.setLineLevel(2);
			appL.setFinalApproverNo(finalApproverNo);
			approvalService.insertApprovalLine2(appL);
		}
		
		int lineNo = appL.getApprovalNo();
		return lineNo;
	}

	//지출 결의서로 이동
	@RequestMapping("expenditureEnrollForm.do")
	public String expenditureEnrollForm() {		
		return "approval/expenditureEnrollForm";
	}
	
	//회의록으로 이동
	@RequestMapping("theMinutesOfAMeetingEnrollForm.do")
	public String theMinutesOfAMeetingForm() {
		return "approval/theMinutesOfAMeetingEnrollForm";
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
