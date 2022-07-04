package com.uni.wt.project.todo.model.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Todo {

    private int todo_no;

    private int pj_no;

    private int emp_no;

    private int board_no;

    private String todo_title;

    private String todo_content;

    private String todo_for;

    private String todo_for_name;

    private String todo_end;

    private String status;

    private String name;

    private String create_date;

    private int count;
}
