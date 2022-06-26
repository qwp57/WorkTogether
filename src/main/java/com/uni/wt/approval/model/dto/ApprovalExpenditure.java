package com.uni.wt.approval.model.dto;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ApprovalExpenditure {
	
	private int approvalNo;
	private int lineNo;
	
	private String exDivision;		//구분
	
	@NotNull(message = "회계 기준월을 선택해주세요")
	private Date accountingMonth;
	
	@NotNull(message = "지출자를 작성해주세요.")
	private String spender;
	
	@NotNull(message = "계좌 정보를 작성해주세요.")
	private String account;
	
	@NotNull(message = "지출 사유를 작성해주세요.")
	private String exContent;
	
	@NotNull(message = "지출 일자를 선택해주세요.")
	private String exDate;
	
	@NotNull(message = "분류를 선택해주세요.")
	private String exClassification;//분류
	
	@NotNull(message = "금액을 작성해주세요.")
	private String amount;
	
	@NotNull(message = "사용 내역을 작성해주세요.")
	private String exHistory;
	
	private String note;
	
}
