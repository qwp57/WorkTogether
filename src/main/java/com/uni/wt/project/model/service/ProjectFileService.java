package com.uni.wt.project.model.service;

import com.uni.wt.common.dto.FileDto;
import com.uni.wt.project.model.dao.ProjectFileMapper;
import com.uni.wt.project.model.dto.ProjectFile;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Service
@Primary
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ProjectFileService {

    @Autowired
    private ProjectFileMapper projectFileMapper;
    public ProjectFile saveFile(MultipartFile file, HttpServletRequest request, int board_no, String isImage)  {//서버에 업로드 하는 메소드
        ProjectFile projectFile;

        String resources = request.getSession().getServletContext().getRealPath("resources");
        String savePath = resources +"\\upload_files\\";

        String originName = file.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        String ext = originName.substring(originName.lastIndexOf("."));
        String changeName = currentTime+ext;
        log.info("[file changeName] :{} ",changeName);
        log.info("[file resources] :{} ",resources);
        log.info(isImage);
        try {
            file.transferTo(new File(savePath+changeName));//업로드된 파일을 transfetTo() 메서드를 이용해서 바꾼 이름과 경로로 파일을 실제 업로드한다.
            //file DB에 넣기
            projectFile = new ProjectFile();
            projectFile.setOrigin_name(originName);
            projectFile.setChange_name(changeName);
            projectFile.setPath(savePath);
            projectFile.setBoard_no(board_no);
            projectFile.setImg_path(isImage);

        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            projectFile = null;
        }

        return projectFile;
    }

    public void uploadFile(MultipartFile file, HttpServletRequest request, int board_no, String isImage) throws Exception {

        ProjectFile projectFile = saveFile(file, request, board_no, isImage);

        if(projectFile != null) {
            log.info("파일이 성공적으로 업로드 됐습니다. {}", projectFile);

            int result = projectFileMapper.insertFile(projectFile);
            log.info("파일 DB 저장 결과 : {}", result);

            if(result < 0) {
                deleteFile(projectFile);
                throw new Exception("파일 DB 저장에 실패했습니다.");
            }

        }else {
            throw new Exception("파일 업로드에 실패했습니다.");
        }
    }
    public void deleteFile(ProjectFile projectFile) throws Exception {

        File file = new File(projectFile.getPath()+projectFile.getChange_name());
        log.info("저장된 파일 경로 : {}", projectFile.getPath()+projectFile.getChange_name());

        if(file.exists()) {
            boolean d= file.delete();
            log.info("파일을 성공적으로 지웠습니다 : {}", d);

        }
        int result = projectFileMapper.deleteFile(projectFile.getFile_no());

        if(result < 0) {
            throw new Exception("파일 수정에 실패했습니다");
        }
    }

    public ProjectFile getFileByBoardNo(int board_no) {
        return projectFileMapper.getFileByBoardNo(board_no);
    }

    public ProjectFile getFileByFileNo(int board_no) {
        return projectFileMapper.getFileByFileNo(board_no);
    }
}
