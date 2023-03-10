package com.uni.wt.project.todo.model.service;

import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.todo.model.dto.Todo;

import java.util.ArrayList;

public interface TodoService {
    void insertTodo(ArrayList<Todo> todo, BoardAll boardAll) throws Exception;

    ArrayList<Todo> detailView(int board_no) throws Exception;

    void changeTodo(int todo_no, String todoStatus) throws Exception;

    int getTodoPercent(int board_no) throws Exception;

    void editTodo(ArrayList<Todo> todos) throws Exception;

    String getEmpNameByEmpNo(int emp_no) throws Exception;
}
