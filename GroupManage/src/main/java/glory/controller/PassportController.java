package glory.controller;


import glory.entity.User;
import glory.service.UserService;
import glory.util.MD5Utils;
import glory.util.ResponseJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Passport")
public class PassportController {

    //依赖注入User服务类
    @Resource
    private UserService userService;


    /**
     * 登录页面
     * @return String
     */
    @RequestMapping(value = "/Login", method = RequestMethod.GET)
    public String login()  {
        return "passport/login";
    }


    /**
     * 注册页面
     * @return String
     */
    @RequestMapping(value = "/Register", method = RequestMethod.GET)
    public String register() {
        return "passport/register";
    }


    /**
     * 退出登录
     * @return String
     */
    @RequestMapping("/Logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("User");
        return "redirect:Login";
    }

    /**
     * 忘记密码页面
     * @return String
     */
    @RequestMapping(value = "/Forgot", method = RequestMethod.GET)
    public String forgot() {
        return "passport/forgot";
    }

    /**
     * Ajax提交登录信息
     * @param  email
     * @param  passwd
     * @param  httpSession
     * @return ResponseJson
     */
    @RequestMapping(value = "/LoginForm", method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson loginForm(@RequestParam("email") String email, @RequestParam("password") String passwd, HttpSession httpSession)  {

        ResponseJson responseJson;
        passwd = MD5Utils.MD5(passwd);

        User user = userService.findByEmail(email);
        if (user != null) {

            if (passwd.equals(user.getPassword())) {
                responseJson = new ResponseJson(0, null, "登录成功");
                user.setPassword("");

                httpSession.setAttribute("User", user);
            } else {
                responseJson = new ResponseJson(103, null, "密码错误");
            }

        } else {
            responseJson = new ResponseJson(102, null, "用户不存在");
        }
        return responseJson;
    }


    /**
     * Ajax提交注册信息
     * @param  email
     * @param  passwd
     * @param  name
     * @return ResponseJson
     */
    @RequestMapping(value = "/RegisterForm", method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson registerForm(@RequestParam("email") String email, @RequestParam("password") String passwd, @RequestParam("name") String name) {
        ResponseJson responseJson;

        passwd = MD5Utils.MD5(passwd);

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(passwd);
        userService.register(user);

        responseJson = new ResponseJson(0, null, "注册成功");

        return responseJson;
    }



    /**
     * Ajax提交忘记密码信息
     * @param
     * @return
     */
    @RequestMapping(value = "/ForgotForm", method = RequestMethod.POST)
    public String forgotForm() {
        return "passport/forgot";
    }

    /**
     * Ajax提交检查用户是否
     * @param  email
     * @return ResponseJson
     */
    @RequestMapping(value = "/CheckUserForm", method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson checkUserForm(@RequestParam("email") String email) {

        ResponseJson responseJson;

        User user = userService.findByEmail(email);

        if (user!=null){
            responseJson =  new ResponseJson(0, null, "用户存在");
        }else {
            responseJson =  new ResponseJson(102, null, "用户不存在");

        }

        return responseJson;
    }
}
