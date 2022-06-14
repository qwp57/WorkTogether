package com.uni.wt.project.post.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.post.model.dto.Post;

public interface PostService {


    void insertPost(Post post, BoardAll boardAll) throws Exception;
}
