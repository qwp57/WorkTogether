package com.uni.wt.project.model.service;

import com.uni.wt.common.dto.PageInfo;
import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.project.boardAll.model.dao.BoardAllMapper;
import com.uni.wt.project.boardAll.model.dto.BoardAll;
import com.uni.wt.project.boardAll.model.dto.Reply;
import com.uni.wt.project.model.dao.ProjectFileMapper;
import com.uni.wt.project.model.dao.ProjectMapper;
import com.uni.wt.project.model.dto.Project;
import com.uni.wt.project.model.dto.ProjectFile;
import com.uni.wt.project.projectMember.model.dto.ProjectTag;
import com.uni.wt.requestWork.model.dao.RequestWorkMapper;
import com.uni.wt.requestWork.model.dto.RequestWork;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Transactional(rollbackFor = Exception.class)
@Slf4j
@Service
@Primary
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private RequestWorkMapper requestWorkMapper;
    @Autowired
    private ProjectFileMapper projectFileMapper;
    private Map<String, Object> paramMap = new HashMap<String, Object>();

    @Override
    public void insertProject(Project project) throws Exception{
        int result = projectMapper.insertProject(project);
        if(result < 0) {
            throw new Exception("프로젝트 생성에 실패하였습니다.");
        }

    }

    @Override
    public ArrayList<Project> selectMyProject(int loginEmp, String type) throws Exception {
        paramMap.put("emp_no", loginEmp);
        paramMap.put("type", type);
        ArrayList<Project> list =  projectMapper.selectMyProject(paramMap);
        paramMap.clear();
        return list;

    }

    @Override
    public ArrayList<Project> selectMyBookmarkProject(int loginEmp, String type) throws Exception {
        paramMap.put("emp_no", loginEmp);
        paramMap.put("type", type);
        ArrayList<Project> list = projectMapper.selectMyBookmarkProject(paramMap);
        paramMap.clear();
        return list;
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
    public ArrayList<Project> selectMyBookmarkProjectByTag(ProjectTag projectTag) throws Exception {
        return projectMapper.selectMyBookmarkProjectByTag(projectTag);
    }

    @Override
    public ArrayList<Project> selectMyProjectByTag(ProjectTag projectTag) throws Exception {
        return projectMapper.selectMyProjectByTag(projectTag);
    }

    @Override
    public  ArrayList<Employee> selectEmpListByPj(int pj_no) throws Exception {
        return projectMapper.selectEmpListByPj(pj_no);
    }

    @Override
    public void editReply(Reply reply) throws Exception {
        int result =  projectMapper.editReply(reply);
        if(result < 0) {
            throw new Exception("댓글 수정에 실패하였습니다.");
        }
    }

    @Override
    public ArrayList<Employee> selectEmpInviteList(int pj_no) throws Exception {
        return projectMapper.selectEmpInviteList(pj_no);
    }

    @Override
    public void editPj(Project project) throws Exception {
        int result =  projectMapper.editPj(project);
        if(result < 0) {
            throw new Exception("프로젝트 수정에 실패하였습니다.");
        }
    }

    @Override
    public void deleteProject(int pj_no) throws Exception {
        int result =  projectMapper.deleteProject(pj_no);
        if(result < 0) {
            throw new Exception("프로젝트 삭제에 실패하였습니다.");
        }
    }

    @Override
    public void keepProject(int pj_no) throws Exception {
        int result =  projectMapper.keepProject(pj_no);
        if(result < 0) {
            throw new Exception("프로젝트 보관에 실패하였습니다.");
        }
    }
    @Override
    public void restoreProject(int pj_no) throws Exception {
        int result =  projectMapper.restoreProject(pj_no);
        if(result < 0) {
            throw new Exception("프로젝트 복구에 실패하였습니다.");
        }
    }

    @Override
    public ArrayList<ProjectFile> getPjFiles(int pj_no, String sort) throws Exception {
        paramMap.put("pj_no", pj_no);
        paramMap.put("sort", sort);
        ArrayList<ProjectFile> list = projectFileMapper.getPjFiles(paramMap);
        paramMap.clear();
        return list;
    }

    @Override
    public ArrayList<RequestWork> loadRw(int pj_no) throws Exception {
        return requestWorkMapper.loadRw(pj_no);
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
