package com.uni.wt.project.post.model.dao;

import com.uni.wt.project.post.model.dto.Post;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {

    public int insertPost(Post post);

    Post detailView(int board_no);

    int increaseCount(int board_no);
}
