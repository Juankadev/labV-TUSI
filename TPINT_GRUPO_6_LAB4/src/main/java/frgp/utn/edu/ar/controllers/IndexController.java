package frgp.utn.edu.ar.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class IndexController {
    @RequestMapping("")
    public ModelAndView index(){
        ModelAndView MV = new ModelAndView();
        MV.setViewName("Index");
        return MV;
    }
}