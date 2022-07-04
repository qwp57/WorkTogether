package com.uni.wt.project.boardAll.model.dao;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.requestWork.model.dto.RequestWork;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.Map;

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

    int getListCount(Map<String, Object> paramMap);

    ArrayList<BoardAll> selectPjBoardList(Map<String, Object> paramMap, RowBounds rwB);

    String selectBoardProfilePic(int board_no);
}
