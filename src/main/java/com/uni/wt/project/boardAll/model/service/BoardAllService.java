package com.uni.wt.project.boardAll.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;

import java.util.ArrayList;

public interface BoardAllService {
    ArrayList<BoardAll> selectAllBoard(int pj_no) throws Exception;
}
