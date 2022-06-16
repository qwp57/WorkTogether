package com.uni.wt.project.projectMember.model.service;

import com.uni.wt.project.projectMember.model.dto.ProjectMember;

import java.util.ArrayList;

public interface ProjectMemberService {
    void insertProjectMember(ProjectMember pjm) throws Exception;

    void insertBookmark(ProjectMember pjm) throws Exception;

    void removeBookmark(ProjectMember pjm) throws Exception;

    ArrayList<ProjectMember> selectProjectColor(int loginEmp);

    void setProjectColor(ProjectMember pjm) throws Exception;
}
