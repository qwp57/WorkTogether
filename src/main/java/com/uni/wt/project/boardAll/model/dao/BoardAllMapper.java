package com.uni.wt.project.boardAll.model.dao;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BoardAllMapper {

    int nextBoardNo();

    int insertBoard(BoardAll boardAll);

    ArrayList<BoardAll> selectAllBoard(int pj_no);

    int deleteBoard(int board_no);

    int increaseCount(int board_no);

    int insertReply(Reply reply);

    ArrayList<Reply>  selectReply(int board_no);

    int deleteReply(int reply_no);

}
