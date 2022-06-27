package com.uni.wt.project.todo.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.todo.model.dto.Todo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class TodoServiceImpl implements TodoService{
    @Override
    public void insertTodo(Todo todo, BoardAll boardAll) {

    }
}
