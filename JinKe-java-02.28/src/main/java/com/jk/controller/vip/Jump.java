package com.jk.controller.vip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Jump {

    @RequestMapping(value ="tiaozhuan1")
    public String tiaozhuan1(){
        return "Watch/show";
    }
}
