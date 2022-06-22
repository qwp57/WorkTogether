package com.uni.wt.project.projectMember.model.dao;

import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ProjectMemberMapper {
    public int insertProjectMember(ProjectMember pjm);

    int insertBookmark(ProjectMember pjm);

    int removeBookmark(ProjectMember pjm);

    ArrayList<ProjectMember> selectProjectColorByEmpNo(int loginEmp);
    ArrayList<ProjectMember> selectProjectColor(ProjectTag projectTag);

    int setProjectColor(ProjectMember pjm);

    ArrayList<ProjectTag> loadTag(int loginEmp);

    ArrayList<ProjectTag> loadTagByPj(ProjectTag projectTag);

    int setProjectTag(ProjectTag projectTag);

    int checkProjectByTag(ProjectTag projectTag);

    int checkBookmark(ProjectTag pj_no);

    int removeTagByPjNo(ProjectTag projectTag);
}
