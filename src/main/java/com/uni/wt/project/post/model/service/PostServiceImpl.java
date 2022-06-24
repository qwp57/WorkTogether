package com.uni.wt.project.post.model.service;

import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.post.model.dao.PostMapper;
import com.uni.wt.project.post.model.dto.Post;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class PostServiceImpl implements PostService {

    @Autowired
    private BoardAllMapper boardAllMapper;
    @Autowired
    private PostMapper postMapper;

    @Override
    public int insertPost(Post post, BoardAll boardAll) throws Exception {
        int board_no = boardAllMapper.nextBoardNo();
        log.info("board_no nextval : " + board_no);

        boardAll.setBoard_no(board_no);
        int result1 = boardAllMapper.insertBoard(boardAll);
        if (result1 < 0) {
            throw new Exception("게시물 등록 실패");
        } else {
            post.setBoard_no(board_no);
            int result2 = postMapper.insertPost(post);


            if (result2 < 0) {
                throw new Exception("게시물 등록 실패");

            } else {
                return board_no;
            }

        }

    }

    @Override
    public Post detailView(int board_no) throws Exception {
        return postMapper.detailView(board_no);

    }
}
