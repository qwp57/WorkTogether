package com.uni.wt.common.commonFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.uni.wt.common.dto.FileDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Primary
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class FileService {
	
	@Autowired
	private FileMapper fileMapper;
	
	private FileDto saveFile(MultipartFile file, HttpServletRequest request)  {//서버에 업로드 하는 메소드 
		FileDto fileDto;
		
		 String resources = request.getSession().getServletContext().getRealPath("resources");
		 String savePath = resources +"\\upload_files\\";
		 
		 String originName = file.getOriginalFilename();
		 String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		 
		 String ext = originName.substring(originName.lastIndexOf("."));
		 String changeName = currentTime+ext;
		log.info("[file changeName] :{} ",changeName);
		 
		 try {
			file.transferTo(new File(savePath+changeName));//업로드된 파일을 transfetTo() 메서드를 이용해서 바꾼 이름과 경로로 파일을 실제 업로드한다. 
			//file DB에 넣기 
			fileDto =  new FileDto(originName, changeName, savePath);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fileDto = null;
		} 
		 
		 return fileDto;
	}

	public int uploadFile(MultipartFile file, HttpServletRequest request, String type) throws Exception {
		
			FileDto uploadedFile = saveFile(file, request);
			
			if(uploadedFile != null) {
				log.info("파일이 성공적으로 업로드 됐습니다. {}", uploadedFile.toString());
				
				int fileNo = fileMapper.getFileSeq();
				
				uploadedFile.setType(type);
				uploadedFile.setFile_no(fileNo);
				
				int result = fileMapper.insertFile(uploadedFile);
				log.info("파일 DB 저장 결과 : {}", result);
				
				if(result > 0) {
					return fileNo;
				}else {
					deleteFile(uploadedFile);
					throw new Exception("파일 DB 저장에 실패했습니다.");
				}
				
			}else {
				throw new Exception("파일 업로드에 실패했습니다.");
			}
			
		
	}

	private void deleteFile(FileDto uploadedFile) {
		
		File file = new File(uploadedFile.getPath()+uploadedFile.getChange_name());
		log.info("저장된 파일 경로 : {}", uploadedFile.getPath()+uploadedFile.getChange_name());
		
		if(file.exists()) {
			boolean d= file.delete();
			log.info("파일을 성공적으로 지웠습니다 : {}", d);
			
		}
		
	}

	public void failed(int fileSeq) throws Exception {
		FileDto file = fileMapper.selectFile(fileSeq);
		
		if(file != null) {
			deleteFile(file);
			int result = fileMapper.deleteFile(fileSeq);
			log.info("파일을 성공적으로 삭제했습니다 {}", result);
		}
		
	}

	public void deleteFile(String res_file) throws Exception {
		FileDto file = fileMapper.selectFile(Integer.parseInt(res_file));
		deleteFile(file);
		
		int result = fileMapper.deleteFile(Integer.parseInt(res_file));
		
		if(result <=0) {
			throw new Exception("파일 수정에 실패했습니다");
		}
		
		
		
	}

}
