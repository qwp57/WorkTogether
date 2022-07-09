package com.uni.wt.project.todo.model.dao;

import com.uni.wt.project.todo.model.dto.Todo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface TodoMapper {
    int insertTodo(Todo todo);

    ArrayList<Todo> detailView(int board_no);


    int changeTodo(Map<String, Object> map);

    int getTodoCompleteCount(int board_no);

    int getTodoTotalCount(int board_no);

    int deleteTodo(int board_no);

    String getEmpNameByEmpNo(int emp_no);
}
