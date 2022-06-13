package com.uni.wt.project.model.service;

import com.uni.wt.project.model.dto.Project;

import java.util.ArrayList;

public interface ProjectService {


    void insertProject(Project project) throws Exception;

    ArrayList<Project> selectAllProject() throws Exception;

    Project selectOneProject(int pj_no) throws Exception;
}
