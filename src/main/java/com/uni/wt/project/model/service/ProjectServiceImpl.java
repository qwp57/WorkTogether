package com.uni.wt.project.model.service;

import com.uni.wt.project.model.dao.ProjectMapper;
import com.uni.wt.project.model.dto.Project;
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
    public ArrayList<Project> selectAllProject() throws Exception {
        return projectMapper.selectAllProject();
    }

    @Override
    public Project selectOneProject(int pj_no) throws Exception {
        return projectMapper.selectOneProject(pj_no);
    }
}
