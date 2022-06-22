package com.uni.wt.project.boardAll.model.service;

import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class BoardAllServiceImpl implements BoardAllService {
    @Autowired
    private BoardAllMapper boardAllMapper;
    @Override
    public ArrayList<BoardAll> selectAllBoard(int pj_no) throws Exception {
        return boardAllMapper.selectAllBoard(pj_no);
    }
}
