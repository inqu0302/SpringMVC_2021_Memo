package com.callor.memo.service.impl;

import com.callor.memo.models.MemoVO;
import com.callor.memo.repository.MemoDao;
import com.callor.memo.service.FileService;
import com.callor.memo.service.MemoService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service("memoServiceV1")
public class MemoServiceImplV1 implements MemoService {

    // 메모리 누수 방지를 위해 생성자 주입
    private final MemoDao mDao;
    private final FileService fileService;

    public MemoServiceImplV1(MemoDao mDao, FileService fileService) {
        this.mDao = mDao;
        this.fileService = fileService;
    }

    @Override
    public List<MemoVO> selectAll() {
        return mDao.findAll();
    }

    @Override
    public MemoVO findById(Long m_seq) {

        return mDao.findById(m_seq).get();

    }

    @Override
    public void insert(MemoVO memo) throws Exception {

        //MultipartFile image = (MultipartFile) memo.getM_image();

       // String strUUID = fileService.fileUp(image);

       // memo.setM_image(strUUID);
        mDao.save(memo);

    }

    @Override
    public void update(MemoVO memo) {

        mDao.save(memo);

    }

    @Override
    public void delete(Long m_seq) {

        mDao.deleteById(m_seq);

    }
}
