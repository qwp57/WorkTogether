package com.uni.wt.project.model.service;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;

import java.util.ArrayList;

public interface ProjectService {


    void insertProject(Project project) throws Exception;


    Project selectOneProject(int pj_no) throws Exception;

    int nextPjNo() throws Exception;

    ArrayList<Project> selectMyProject(int loginEmp) throws Exception;

    ArrayList<Project> selectMyBookmarkProject(int loginEmp) throws Exception;

    int getProjectMemberCount(int pj_no) throws Exception;

    void addTag(ProjectTag pjTag) throws Exception;

    void editTag(ProjectTag pjTag) throws Exception;

    void removeTag(ProjectTag pjTag) throws Exception;

    ArrayList<Project> selectMyBookmarkProjectByTag(ProjectTag projectTag) throws Exception;

    ArrayList<Project> selectMyProjectByTag(ProjectTag projectTag) throws Exception;

    ArrayList<Employee> selectEmpListByPj(int pj_no) throws Exception;

    void editReply(Reply reply) throws Exception;
}
