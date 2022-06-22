package com.uni.wt.project.model.dao;

import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import org.apache.ibatis.annotations.Mapper;
import com.uni.wt.project.model.dto.Project;

import java.util.ArrayList;

@Mapper
public interface ProjectMapper {

    public int insertProject(Project pj);

    public ArrayList<Project> selectMyProject(int loginEmp);
    ArrayList<Project> selectMyBookmarkProject(int loginEmp);

    Project selectOneProject(int pj_no);

    int nextPjNo();

    int getProjectMemberCount(int pj_no);

    int addTag(ProjectTag pjTag);

    int editTag(ProjectTag pjTag);

    int removeTag(ProjectTag pjTag);

    ArrayList<Project> selectMyBookmarkProjectByTag(ProjectTag tag_no);

    ArrayList<Project> selectMyProjectByTag(ProjectTag tag_no);

}
