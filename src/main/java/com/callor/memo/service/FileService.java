package com.callor.memo.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

    public String fileUp(MultipartFile file) throws Exception;

    public int delete(String imgFileName);
}
