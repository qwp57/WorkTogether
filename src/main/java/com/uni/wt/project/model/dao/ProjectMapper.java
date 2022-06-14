package com.uni.wt.project.model.dao;

import org.apache.ibatis.annotations.Mapper;
import com.uni.wt.project.model.dto.Project;

import java.util.ArrayList;

@Mapper
public interface ProjectMapper {

    public int insertProject(Project pj);

    public ArrayList<Project> selectAllProject(int loginEmp);

    Project selectOneProject(int pj_no);

    int nextPjNo();
}
