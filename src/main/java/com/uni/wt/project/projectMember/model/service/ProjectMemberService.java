package com.uni.wt.project.projectMember.model.service;

import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;

import java.util.ArrayList;

public interface ProjectMemberService {
    void insertProjectMember(ProjectMember pjm) throws Exception;

    void insertBookmark(ProjectMember pjm) throws Exception;

    void removeBookmark(ProjectMember pjm) throws Exception;

    ArrayList<ProjectMember> selectProjectColor(int loginEmp);

    void setProjectColor(ProjectMember pjm) throws Exception;

    ArrayList<ProjectTag> loadTag(int loginEmp) throws Exception;

    void setProjectTag(ProjectTag projectTag) throws Exception;
}
