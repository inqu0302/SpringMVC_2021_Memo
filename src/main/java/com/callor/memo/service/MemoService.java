package com.callor.memo.service;

import com.callor.memo.models.MemoVO;

import java.util.List;

public interface MemoService {

    public List<MemoVO> selectAll();
    public MemoVO findById(Long seq);

    public void insert(MemoVO memo);
    public void update(MemoVO memo);
    public void delete(Long seq);

}
