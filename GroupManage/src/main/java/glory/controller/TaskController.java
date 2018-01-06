package glory.controller;


import glory.entity.Task;
import glory.entity.User;
import glory.service.TaskService;
import glory.service.UserService;
import glory.util.ResponseJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("Task")
public class TaskController {

    @Resource
    private TaskService taskService;

    @Resource
    private UserService userService;

    /**
     * 任务列表页
     * @param  request
     * @return String
     */
    @RequestMapping(value = "List",method = RequestMethod.GET)
    public String list(HttpServletRequest request){
        List<Task> tasks =  taskService.findAll();
        List<User> users =  userService.findAll();
        if (users!=null){
            request.setAttribute("users", users);
        }
        if (tasks !=null){
            request.setAttribute("tasks", tasks);
        }
        return "task/list";
    }


    /**
     * 新建任务页
     * @param  request
     * @return
     */
    @RequestMapping(value = "Create",method = RequestMethod.GET)
    public String create(HttpServletRequest request){
        List<User> users =  userService.findAll();
        if (users!=null){
            request.setAttribute("users", users);
        }
        return "task/handler";
    }


    /**
     * 编辑任务页
     * @param  id
     * @param  request
     * @return String
     */
    @RequestMapping(value = "Edit",method = RequestMethod.GET)
    public String edit(HttpServletRequest request,@RequestParam("id") int id){
        Task task = taskService.getTaskById(id);
        if (task !=null){
            request.setAttribute("task", task);
        }
        List<User> users =  userService.findAll();
        if (users!=null){
            request.setAttribute("users", users);
        }
        return "task/handler";
    }

    /**
     * 任务详情页
     * @param  id
     * @param  request
     * @return String
     */
    @RequestMapping(value = "Details",method = RequestMethod.GET)
    public String details(HttpServletRequest request,@RequestParam("id") int id){
        Task task = taskService.getTaskById(id);
        if (task !=null){
            request.setAttribute("task", task);
        }
        List<User> users =  userService.findAll();
        if (users!=null){
            request.setAttribute("users", users);
        }
        return "task/details";
    }


    /**
     * Ajax提交编辑任务信息
     * @param  id
     * @param  name
     * @param  describe
     * @param  receiverId
     * @return ResponseJson
     */
    @RequestMapping(value = "EditForm",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson editForm(
            HttpServletRequest request,
            @RequestParam("id") int id,
            @RequestParam("name") String name,
            @RequestParam("describe") String describe,
            @RequestParam("receiverId") int receiverId,
            @RequestParam("status") String status
    ){
//        System.out.println(id);
//        System.out.println(name);
//        System.out.println(describe);
//        System.out.println(receiverId);
        Task  task= taskService.getTaskById(id);

        ResponseJson responseJson;

        task.setName(name);
        task.setDescription(describe);
        task.setReceiverId(receiverId);
        task.setStatus(status);
        taskService.updateTask(task);
        responseJson = new ResponseJson(0, null, "编辑成功");
        return responseJson;
    }

    /**
     * Ajax提交新建任务信息
     * @param  name
     * @param  describe
     * @param  receiverId
     * @return ResponseJson
     */
    @RequestMapping(value = "CreateForm",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson createForm(
            @RequestParam("name") String name,
            @RequestParam("describe") String describe,
            @RequestParam("receiverId") int receiverId,
            HttpSession httpSession ){
        ResponseJson responseJson;
        User user= (User) httpSession.getAttribute("User");

        Task task = new Task();
        task.setName(name);
        task.setDescription(describe);
        task.setReceiverId(receiverId);
        task.setPostId(user.getId());

        taskService.saveTask(task);


        responseJson = new ResponseJson(0, null, "新添成功");


        return responseJson;

    }

    /**
     * Ajax提交删除信息
     * @param  id
     * @return ResponseJson
     */
    @RequestMapping(value = "DeleteForm",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson deleteForm(@RequestParam("id") int id){
        ResponseJson responseJson;

        Task task = new Task();
        task.setId(id);

        taskService.deleteTask(task);

        responseJson = new ResponseJson(0, null, "删除成功");

        return responseJson;
    }
}
