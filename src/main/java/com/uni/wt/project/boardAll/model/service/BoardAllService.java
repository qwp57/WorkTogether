package com.uni.wt.project.boardAll.model.service;

import com.uni.wt.common.commonFile.SearchDto;
import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;

import java.util.ArrayList;

public interface BoardAllService {
    ArrayList<BoardAll> selectAllBoard(int pj_no) throws Exception;

    void deleteBoard(int board_no) throws Exception;

    void increaseCount(int board_no) throws Exception;

    void insertReply(Reply reply) throws Exception;

    ArrayList<Reply> selectReply(int board_no) throws Exception;

    void deleteReply(int reply_no) throws Exception;

    ArrayList<BoardAll> selectPjBoardList(int pj_no, PageInfo pi, String boardType, int emp_no, SearchDto sd) throws Exception;

    int getListCount(int pj_no, String all, int emp_no, SearchDto sd) throws Exception;
}
