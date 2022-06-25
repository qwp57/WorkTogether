package com.uni.wt.common.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.common.notice.dto.Notice;
import com.uni.wt.requestWork.model.dto.RequestWork;

@Mapper
public interface NoticeMapper {

	int insertNotice(Notice notice)throws Exception;

	ArrayList<Notice> selectNoticeList(String emp_no)throws Exception;

	int getNoticeSeq()throws Exception;

	Notice selectNotice(int nno)throws Exception;

	int deleteNotice(int notice_no)throws Exception;

	

}
