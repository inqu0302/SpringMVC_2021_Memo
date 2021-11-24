package com.callor.memo.controller;

import com.callor.memo.models.MemoVO;
import com.callor.memo.service.MemoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value="/fetch", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String write(@RequestBody Map<String, String> maps){

        log.debug("fetch 로 전송");
        log.debug("Map {} ", maps.toString());
        log.debug("seq {} ",maps.get("seq"));
        log.debug("author {} ",maps.get("author"));

        return "redirect:/list";
    }

    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String list(Model model) {

        List MemoVO = memoServiceV1.selectAll();

        model.addAttribute("M_LIST", MemoVO);

        return "memo/list";
    }
}
