package com.uni.wt.common.notice.dao;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.common.notice.dto.Notice;
import com.uni.wt.requestWork.model.dto.RequestWork;

@Mapper
public interface NoticeMapper {

	int insertNotice(Notice notice)throws Exception;

	

}
