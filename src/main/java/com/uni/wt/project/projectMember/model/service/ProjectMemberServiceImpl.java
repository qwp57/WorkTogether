package com.uni.wt.project.projectMember.model.service;

import com.uni.wt.project.projectMember.model.dao.ProjectMemberMapper;
import com.uni.wt.project.projectMember.model.dto.ProjectMember;
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
public class ProjectMemberServiceImpl implements ProjectMemberService{
    @Autowired
    private ProjectMemberMapper projectMemberMapper;
    @Override
    public void insertProjectMember(ProjectMember pjm) throws Exception {
        projectMemberMapper.insertProjectMember(pjm);
    }

    @Override
    public void insertBookmark(ProjectMember pjm) throws Exception {
        log.info("[ProjectServiceImpl] pj_no : " + pjm.getPj_no());
        int result = projectMemberMapper.insertBookmark(pjm);

        if (result < 0){
            throw new Exception("즐겨찾기 추가 실패");
        }
    }

    @Override
    public void removeBookmark(ProjectMember pjm) throws Exception {
        int result = projectMemberMapper.removeBookmark(pjm);

        if (result < 0){
            throw new Exception("즐겨찾기 삭제 실패");
        }
    }

    @Override
    public ArrayList<ProjectMember> selectProjectColor(int loginEmp) {

        return projectMemberMapper.selectProjectColor(loginEmp);
    }

    @Override
    public void setProjectColor(ProjectMember pjm) throws Exception {
        int result = projectMemberMapper.setProjectColor(pjm);

        if (result < 0){
            throw new Exception("색상 설정 실패");
        }
    }

    @Override
    public ArrayList<ProjectTag> loadTag(int loginEmp) throws Exception {
        return projectMemberMapper.loadTag(loginEmp);
    }

    @Override
    public void setProjectTag(ProjectTag projectTag) throws Exception {
        int result = projectMemberMapper.setProjectTag(projectTag);

        if (result < 0){
            throw new Exception("태그 설정 실패");
        }
    }
}
