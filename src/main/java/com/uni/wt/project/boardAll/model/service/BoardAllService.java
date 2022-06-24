package com.uni.wt.project.boardAll.model.service;

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
}
