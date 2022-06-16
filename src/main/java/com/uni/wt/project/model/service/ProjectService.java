package com.uni.wt.project.model.service;

import com.uni.wt.project.model.dto.Project;

import java.util.ArrayList;

public interface ProjectService {


    void insertProject(Project project) throws Exception;


    Project selectOneProject(int pj_no) throws Exception;

    int nextPjNo() throws Exception;

    ArrayList<Project> selectMyProject(int loginEmp) throws Exception;

    ArrayList<Project> selectMyBookmarkProject(int loginEmp) throws Exception;
}
