package com.uni.wt.project.projectMember.model.service;

import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;

import java.util.ArrayList;

public interface ProjectMemberService {
    void insertProjectMember(ProjectMember pjm) throws Exception;

    void insertBookmark(ProjectMember pjm) throws Exception;

    void removeBookmark(ProjectMember pjm) throws Exception;

    ArrayList<ProjectMember> selectProjectColor(ProjectTag projectTag);
    ArrayList<ProjectMember> selectProjectColor(int loginEmp);

    void setProjectColor(ProjectMember pjm) throws Exception;

    ArrayList<ProjectTag> loadTag(int loginEmp) throws Exception;

    ArrayList<ProjectTag> loadTagByPj(ProjectTag projectTag) throws Exception;

    void setProjectTag(ProjectTag projectTag) throws Exception;

    int checkProjectByTag(ProjectTag projectTag) throws Exception;

    int checkBookmark(ProjectTag pj_no) throws Exception;
}
