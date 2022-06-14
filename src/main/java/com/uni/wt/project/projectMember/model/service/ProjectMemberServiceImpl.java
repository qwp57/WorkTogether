package com.uni.wt.project.projectMember.model.service;

import com.uni.wt.project.projectMember.model.dao.ProjectMemberMapper;
import com.uni.wt.project.projectMember.model.dto.ProjectMember;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ProjectMemberServiceImpl implements ProjectMemberService{
    @Autowired
    private ProjectMemberMapper projectMemberMapper;
    @Override
    public void insertProjectMember(ProjectMember pjm) throws Exception {
        projectMemberMapper.insertProjectMember(pjm);
    }
}
