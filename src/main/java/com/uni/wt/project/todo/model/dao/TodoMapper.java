package com.uni.wt.project.todo.model.dao;

import com.uni.wt.project.todo.model.dto.Todo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface TodoMapper {
    int insertTodo(Todo todo);

    ArrayList<Todo> detailView(int board_no);

    int completeTodo(int todo_no);

    int uncompleteTodo(int todo_no);
}
