package com.uni.wt.project.todo.model.service;

import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.todo.model.dao.TodoMapper;
import com.uni.wt.project.todo.model.dto.Todo;
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
public class TodoServiceImpl implements TodoService {
    @Autowired
    private BoardAllMapper boardAllMapper;
    @Autowired
    private TodoMapper todoMapper;

    @Override
    public void insertTodo(ArrayList<Todo> todo, BoardAll boardAll) throws Exception {
        int board_no = boardAllMapper.nextBoardNo();
        boardAll.setBoard_no(board_no);
        int result1 = boardAllMapper.insertBoard(boardAll);
        if (result1 < 0) {
            throw new Exception("게시물 등록 실패");
        } else {
            for (int i = 0; i < todo.size(); i++) {
                todo.get(i).setBoard_no(board_no);
                int result2 = todoMapper.insertTodo(todo.get(i));

                if (result2 < 0) {
                    throw new Exception("게시물 등록 실패");

                }
            }
        }
    }

    @Override
    public ArrayList<Todo> detailView(int board_no) throws Exception {
        return todoMapper.detailView(board_no);
    }

    @Override
    public void completeTodo(int todo_no) throws Exception {
        int result = todoMapper.completeTodo(todo_no);
        if (result < 0) {
            throw new Exception("할일 완료 실패");
        }
    }

    @Override
    public void uncompleteTodo(int todo_no) throws Exception {
        int result = todoMapper.uncompleteTodo(todo_no);
        if (result < 0) {
            throw new Exception("할일 미완료 실패");
        }
    }
}
