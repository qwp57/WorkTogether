package com.uni.wt.project.post.model.dto;

import lombok.Data;

@Data
public class Post {

    private int board_no;

    private int pj_no;

    private int emp_no;

    private String post_title;

    private String post_content;

    private String post_for;

    private String name;

    private String create_date;

    private int count;

}
