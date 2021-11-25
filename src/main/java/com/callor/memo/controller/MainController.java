package com.callor.memo.controller;

import com.callor.memo.models.MemoVO;
import com.callor.memo.service.FileService;
import com.callor.memo.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Controller
public class MainController {

    protected final MemoService memoServiceV1;

    public MainController(MemoService memoServiceV1) {
        this.memoServiceV1 = memoServiceV1;
    }

    @RequestMapping(value="/", method= RequestMethod.GET)
    public String Home(){
        return "memo/list";
    }

    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String write(Model model){

        Date today = new Date(System.currentTimeMillis());

        SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dt = new SimpleDateFormat("HH:mm");

        String date = dd.format(today);
        String time = dt.format(today);

        model.addAttribute("DATE", date);
        model.addAttribute("TIME", time);
        return "memo/write";
    }

    @RequestMapping(value="/writer", method=RequestMethod.POST)
    public String writer(@RequestBody MemoVO memoVO) throws Exception {

        log.debug(memoVO.toString());
        memoServiceV1.insert(memoVO);

        return "memo/wirte";
    }

    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String list(Model model) {

        List MemoVO = memoServiceV1.selectAll();

        model.addAttribute("M_LIST", MemoVO);

        return "memo/list";
    }

    @RequestMapping(value="/detail", method=RequestMethod.GET)
    public String detail(String seq, Model model, MemoVO memoVO){

        log.debug("seq {} ",seq);

        memoVO = memoServiceV1.findById(Long.valueOf(seq));

        log.debug("memoVO {}", memoVO.toString());

        model.addAttribute("M_LIST",memoVO);

        return "memo/detail";
    }

    @RequestMapping(value="delete", method=RequestMethod.GET)
    public String delete(String seq){

        log.debug("seq {} ",seq);

        memoServiceV1.delete(Long.valueOf(seq));

        return "redirect:/list";
    }

    @RequestMapping(value="update", method=RequestMethod.GET)
    public String update(String seq, Model model, MemoVO memoVO){

        log.debug("seq {} ",seq);

        memoVO = memoServiceV1.findById(Long.valueOf(seq));

        log.debug("memoVO {}", memoVO.toString());

        model.addAttribute("M_LIST",memoVO);

        return "memo/write";
    }
}
