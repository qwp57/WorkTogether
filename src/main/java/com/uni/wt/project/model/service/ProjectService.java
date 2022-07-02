package com.uni.wt.project.model.service;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.dto.ProjectFile;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.requestWork.model.dto.RequestWork;

import java.util.ArrayList;

public interface ProjectService {


    void insertProject(Project project) throws Exception;


    Project selectOneProject(int pj_no) throws Exception;

    int nextPjNo() throws Exception;

    ArrayList<Project> selectMyProject(int loginEmp, String type) throws Exception;

    ArrayList<Project> selectMyBookmarkProject(int loginEmp, String type) throws Exception;

    int getProjectMemberCount(int pj_no) throws Exception;

    void addTag(ProjectTag pjTag) throws Exception;

    void editTag(ProjectTag pjTag) throws Exception;

    void removeTag(ProjectTag pjTag) throws Exception;

    ArrayList<Project> selectMyBookmarkProjectByTag(ProjectTag projectTag) throws Exception;

    ArrayList<Project> selectMyProjectByTag(ProjectTag projectTag) throws Exception;

    ArrayList<Employee> selectEmpListByPj(int pj_no) throws Exception;

    void editReply(Reply reply) throws Exception;

    ArrayList<Employee> selectEmpInviteList(int pj_no) throws Exception;

    void editPj(Project project) throws Exception;

    void deleteProject(int pj_no) throws Exception;

    void keepProject(int pj_no) throws Exception;

    ArrayList<RequestWork> loadRw(int pj_no) throws Exception;

    void restoreProject(int pj_no) throws Exception;

    ArrayList<ProjectFile> getPjFiles(int pj_no, String sort) throws Exception;
}
