package com.callor.memo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MainController {

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

    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String list(Model model) {

        String s = "";

        return "memo/list";
    }
}
