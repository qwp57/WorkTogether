package com.uni.wt.project.projectMember.model.dao;

import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMemberMapper {
    public int insertProjectMember(ProjectMember pjm);

}
