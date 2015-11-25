package com.eden.noah.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginAction{

/*    @RequestMapping(value="/")
    public String renderMainView(HttpServletRequest request,HttpServletResponse response){

        return "flow";
    }    
    

    
    @RequestMapping(value="/login")
    public String home(HttpServletRequest request,HttpServletResponse response){

        return "login";
    }    */
	
    @RequestMapping(value="/login")
    public String home(HttpServletRequest request,HttpServletResponse response){

        return "login";
    }	
}
