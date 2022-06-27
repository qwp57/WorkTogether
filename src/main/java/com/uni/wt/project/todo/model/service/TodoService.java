package com.uni.wt.project.todo.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.todo.model.dto.Todo;

public interface TodoService {
    void insertTodo(Todo todo, BoardAll boardAll);
}
