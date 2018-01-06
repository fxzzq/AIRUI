package glory.controller;

import glory.entity.Group;
import glory.entity.User;
import glory.service.GroupService;
import glory.service.UserService;
import glory.service.impl.GroupServiceImpl;
import glory.service.impl.UserServiceImpl;
import glory.util.ResponseJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.nio.file.attribute.GroupPrincipal;
import java.util.List;

/**
 * Created by Monster on 2017/11/18.
 */

@Controller
@RequestMapping("Group")
public class GroupController {

    @Resource
    private GroupService groupService = new GroupServiceImpl();

    @Resource
    private UserService userService = new UserServiceImpl();


    /**
     * 组列表页面
     * @param  request
     * @return string
     */
    @RequestMapping(value = "List",method = RequestMethod.GET)
    public String list(HttpServletRequest request){
        List<Group> groups  =  groupService.findAll();
        if (groups!=null){
            request.setAttribute("groups", groups);
        }
        return "group/list";
    }


    /**
     * 创建和编辑组页面
     * @param  request
     * @param id
     * @return string
     */
    @RequestMapping(value = "Handler",method = RequestMethod.GET)
    public String create(HttpServletRequest request, @RequestParam("id") String id){

        List<Group> groups  = groupService.findAll();
        if (groups!=null){
            request.setAttribute("groups", groups);
        }

        List<User> users =  userService.findAll();
        if (users!=null){
            request.setAttribute("users", users);
        }
        request.setAttribute("filter", Integer.parseInt(id));
        return "group/handler";
    }

    /**
     * 组成员页面
     * @param  request
     * @param gid
     * @return string
     */
    @RequestMapping(value = "MyGroup",method = RequestMethod.GET)
    public String myGroup(HttpServletRequest request, @RequestParam("gid") String gid){

        List<User> myGroup  = userService.getMyGroup(Integer.parseInt(gid));
        if (myGroup!=null){
            request.setAttribute("myGroup", myGroup);
        }
        return "group/mygroup";
    }


    /**
     * 加入组页面
     * @param  request
     * @return string
     */
    @RequestMapping(value = "JoinGroup",method = RequestMethod.GET)
    public String joinGroup(HttpServletRequest request){
        List<Group> groups  =  groupService.findAll();
        if (groups!=null){
            request.setAttribute("groups", groups);
        }
        return "group/joingroup";
    }


    /**
     * Ajax提交删除组
     * @param  id
     * @return ResponseJson
     */
    @RequestMapping(value = "DeleteGroupForm",method = RequestMethod.POST)
    public @ResponseBody
    ResponseJson delete(@RequestParam("id") String id){

        ResponseJson responseJson;
        Group  group = new Group();
        group.setId(Integer.parseInt(id));
        groupService.deleteGroup(group);

           responseJson = new ResponseJson(0, null, "成功");

        return responseJson;
    }

    /**
     * Ajax提交创建组
     * @param  groupName
     * @param  leaderId
     * @return ResponseJson
     */
    @RequestMapping(value = "CreateGroupForm", method = RequestMethod.POST)
    public @ResponseBody
    ResponseJson CreateGroupForm(@RequestParam("groupName") String groupName, @RequestParam("leaderId") String leaderId) {

        ResponseJson responseJson;

        Group group = new Group();
        group.setGroupName(groupName);
        group.setLeaderId(Integer.parseInt(leaderId));
        groupService.saveGroup(group);

        responseJson = new ResponseJson(0, null, "成功");


        return responseJson;
    }

    /**
     * Ajax提交编辑组
     * @param  groupName
     * @param  leaderId
     * @return ResponseJson
     */
    @RequestMapping(value = "EditGroupForm", method = RequestMethod.POST)
    public @ResponseBody
    ResponseJson EditGroupForm(@RequestParam("groupName") String groupName, @RequestParam("leaderId") String leaderId, @RequestParam("grouptId") String grouptId) {
        ResponseJson responseJson;

        Group group = new Group();
        group.setId(Integer.parseInt(grouptId));
        group.setGroupName(groupName);
        group.setLeaderId(Integer.parseInt(leaderId));
        groupService.updateGroup(group);

        responseJson = new ResponseJson(0, null, "成功");

        return responseJson;
    }

}
