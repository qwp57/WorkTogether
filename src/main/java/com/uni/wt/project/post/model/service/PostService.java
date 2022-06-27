package com.uni.wt.project.post.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.post.model.dto.Post;

public interface PostService {


    int insertPost(Post post, BoardAll boardAll) throws Exception;

    Post detailView(int board_no) throws Exception;

    void editPost(Post post) throws Exception;
}
