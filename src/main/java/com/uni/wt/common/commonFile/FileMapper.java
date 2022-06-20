package com.uni.wt.common.commonFile;

import org.apache.ibatis.annotations.Mapper;

import com.uni.wt.common.dto.FileDto;

@Mapper
public interface FileMapper {

	public int getFileSeq()throws Exception;

	public int insertFile(FileDto uploadedFile)throws Exception;

	public FileDto selectFile(int fileSeq)throws Exception;

	public int deleteFile(int fileSeq)throws Exception;

	

}
