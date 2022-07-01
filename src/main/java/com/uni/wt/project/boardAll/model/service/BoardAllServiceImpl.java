package com.uni.wt.project.boardAll.model.service;

import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class BoardAllServiceImpl implements BoardAllService {
    @Autowired
    private BoardAllMapper boardAllMapper;

    private Map<String, Object> paramMap = new HashMap<String, Object>();
    @Override
    public ArrayList<BoardAll> selectAllBoard(int pj_no) throws Exception {
        return boardAllMapper.selectAllBoard(pj_no);
    }

    @Override
    public void deleteBoard(int board_no) throws Exception {
        int result =  boardAllMapper.deleteBoard(board_no);
        
        if(result < 0) {
            throw new Exception("게시물 삭제에 실패하였습니다.");
        }
        log.info("게시물 삭제");
    }

    @Override
    public void increaseCount(int board_no) throws Exception {
        int result = boardAllMapper.increaseCount(board_no);
        if (result < 0) {
            throw new Exception("조회수 증가 실패");
        }

    }

    @Override
    public void insertReply(Reply reply) throws Exception {
        int result = boardAllMapper.insertReply(reply);
        if (result < 0) {
            throw new Exception("댓글 등록 실패");
        }
    }

    @Override
    public ArrayList<Reply>  selectReply(int board_no) throws Exception {
        return boardAllMapper.selectReply(board_no);
    }

    @Override
    public void deleteReply(int reply_no) throws Exception {
        int result = boardAllMapper.deleteReply(reply_no);
        if (result < 0) {
            throw new Exception("댓글 삭제 실패");
        }
    }

    @Override
    public int getListCount(int pj_no, String board_type) throws Exception {
        log.info("글타입: " + board_type);
        paramMap.put("board_type", board_type);
        paramMap.put("pj_no", pj_no);
        int result = boardAllMapper.getListCount(paramMap);
        paramMap.clear();
        return result;
    }

    @Override
    public ArrayList<BoardAll> selectPjBoardList(int pj_no,PageInfo pi, String board_type) throws Exception {
        int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
        RowBounds rwB = new RowBounds(offset, pi.getBoardLimit());
        paramMap.put("board_type", board_type);
        paramMap.put("pj_no", pj_no);
        ArrayList<BoardAll> list = boardAllMapper.selectPjBoardList(paramMap, rwB);
        paramMap.clear();
        return  list;
    }

}
