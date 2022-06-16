package com.uni.wt.project.model.service;

import com.uni.wt.project.model.dao.ProjectMapper;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public void insertProject(Project project) throws Exception{
        int result = projectMapper.insertProject(project);
        if(result < 0) {
            throw new Exception("프로젝트 생성에 실패하였습니다.");
        }

    }

    @Override
    public ArrayList<Project> selectMyProject(int loginEmp) throws Exception {
        return projectMapper.selectMyProject(loginEmp);
    }

    @Override
    public ArrayList<Project> selectMyBookmarkProject(int loginEmp) throws Exception {
        return projectMapper.selectMyBookmarkProject(loginEmp);
    }

    @Override
    public int getProjectMemberCount(int pj_no) throws Exception{
        return projectMapper.getProjectMemberCount(pj_no);
    }

    @Override
    public void addTag(ProjectTag pjTag) throws Exception {
      
        int result =  projectMapper.addTag(pjTag);
        if(result < 0) {
            throw new Exception("태그 등록에 실패하였습니다.");
        }
    }

    @Override
    public void editTag(ProjectTag pjTag) throws Exception {
        int result =  projectMapper.editTag(pjTag);
        if(result < 0) {
            throw new Exception("태그 수정에 실패하였습니다.");
        }
    }

    @Override
    public void removeTag(ProjectTag pjTag) throws Exception {
        int result =  projectMapper.removeTag(pjTag);
        if(result < 0) {
            throw new Exception("태그 삭제에 실패하였습니다.");
        }
    }

    @Override
    public Project selectOneProject(int pj_no) throws Exception {
        return projectMapper.selectOneProject(pj_no);
    }

    @Override
    public int nextPjNo() throws Exception {
        return projectMapper.nextPjNo();
    }

}
