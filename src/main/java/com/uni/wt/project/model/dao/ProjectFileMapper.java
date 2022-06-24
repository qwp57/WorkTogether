package com.uni.wt.project.model.dao;

import com.uni.wt.common.dto.FileDto;
import com.uni.wt.project.model.dto.ProjectFile;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectFileMapper {
    public int insertFile(ProjectFile projectFile)throws Exception;
}
