package com.uni.wt.common.commonFile;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@RequiredArgsConstructor()
@ToString(includeFieldNames = true)
@EqualsAndHashCode
public class SearchDto {
	
	private String searchTarget;
	private String searchKeyword;
	
	public SearchDto(String searchTarget, String searchKeyword) {
		super();
		this.searchTarget = searchTarget;
		this.searchKeyword = searchKeyword;
	}
	

}
