package com.uni.wt.project.boardAll.model.dao;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardAllMapper {

    public int nextBoardNo();
    public int insertBoard(BoardAll boardAll);
}
