package glory.controller;

import glory.entity.Group;
import glory.entity.Role;
import glory.entity.User;
import glory.service.GroupService;
import glory.service.RoleService;
import glory.service.UserService;
import glory.service.impl.GroupServiceImpl;
import glory.service.impl.RoleServiceImpl;
import glory.service.impl.UserServiceImpl;
import glory.util.ResponseJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Monster on 2017/11/18.
 */
@Controller
@RequestMapping("User")
public class UserController {

    @Resource
    private UserService userService = new UserServiceImpl();

    @Resource
    private RoleService roleService = new RoleServiceImpl();

    @Resource
    private GroupService groupService = new GroupServiceImpl();


    /**
     * 用户列表
     * @param  request
     * @return String
     */
    @RequestMapping(value = "/List", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {

        List<User> users = userService.findAll();
        if (users != null) {
            request.setAttribute("users", users);
        }

        List<Group> groups = groupService.findAll();
        if (groups != null) {
            request.setAttribute("groups", groups);
        }

        List<Role> roles = roleService.findAll();
        if (roles != null) {
            request.setAttribute("roles", roles);
        }

        return "user/list";
    }


    /**
     * Ajax编辑用户信息
     * @param  id
     * @param  groupId
     * @param  roleId
     * @return ResponseJson
     */
    @RequestMapping(value = "/EditForm", method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson edit(@RequestParam("id") String id, @RequestParam("groupId") String groupId, @RequestParam("roleId") String roleId) {
        ResponseJson responseJson;

        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setRoleId(Integer.parseInt(roleId));
        user.setGroupId(Integer.parseInt(groupId));

        userService.updateUser(user);

        responseJson = new ResponseJson(0, null, "编辑成功");

        return responseJson;

    }

    /**
     * Ajax提交删除用户
     * @param  id
     * @return ResponseJson
     */
    @RequestMapping(value = "/DeleteForm", method = RequestMethod.POST)
     @ResponseBody
    public  ResponseJson delete(@RequestParam("id") int id) {
        ResponseJson responseJson;

        User user = new User();

        user.setId(id);

        userService.deleteUser(user);

        responseJson = new ResponseJson(0, null, "删除成功");

        return responseJson;

    }

}
