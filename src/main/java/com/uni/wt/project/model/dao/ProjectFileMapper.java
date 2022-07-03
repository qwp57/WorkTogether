package com.uni.wt.project.model.dao;

import com.uni.wt.common.dto.FileDto;
import com.uni.wt.project.model.dto.ProjectFile;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface ProjectFileMapper {
    int insertFile(ProjectFile projectFile) throws Exception;

    ProjectFile getFileByBoardNo(int board_no);

    ProjectFile getFileByFileNo(int file_no);

    int deleteFile(int file_no);

    ArrayList<ProjectFile> getPjFiles(Map<String, Object> paramMap);
}
