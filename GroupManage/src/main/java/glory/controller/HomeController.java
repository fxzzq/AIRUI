package glory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {


    /**
     * 首页
     * @return String
     */
    @RequestMapping(value = "/Home", method = RequestMethod.GET)
    public String login(){

        return "home/home";
    }
}
