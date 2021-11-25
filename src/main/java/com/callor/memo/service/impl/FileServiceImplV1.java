package com.callor.memo.service.impl;

import com.callor.memo.service.FileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Slf4j
@Service("fileServiceV1")
public class FileServiceImplV1 implements FileService {

    private final String winPath;

    public FileServiceImplV1(String winPath) {
        this.winPath = winPath;
    }

    @Override
    public String fileUp(MultipartFile file) throws Exception {

        String originFilename = file.getOriginalFilename();
        if(originFilename == null || originFilename.isEmpty()){
            return "";
        }

        String filePath = this.winPath;

        String strUUID = UUID.randomUUID().toString();
        strUUID += originFilename;

        File uploadPathAndFile = new File(filePath, strUUID);
        file.transferTo(uploadPathAndFile);

        return strUUID;
    }

    @Override
    public int delete(String imgFileName) {

        if(imgFileName == null || imgFileName.isEmpty()){
            return 1;
        }

        File delFile = new File(winPath, imgFileName);

        if(delFile.exists()){
            boolean ok = delFile.delete();

            if(ok){
                log.debug("파일 삭제 성공");
                return 1;
            } else {
                log.debug("파일 삭제 실패");
                return -1;
            }
        }

        return 1;
    }
}
