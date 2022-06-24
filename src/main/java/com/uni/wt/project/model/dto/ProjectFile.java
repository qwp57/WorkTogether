package com.uni.wt.project.model.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class ProjectFile {


    private int file_no;
    private int board_no;
    private Date upload_date;
    private String origin_name;
    private String change_name;
    private String path;
    private String img_path;

}
