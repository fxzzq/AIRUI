package glory.controller;


import glory.entity.Chat;
import glory.entity.User;
import glory.service.ChatService;
import glory.service.impl.ChatServiceImpl;
import glory.util.ResponseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("Chat")
public class ChatController {

    @Autowired(required = true)
    private ChatService chatService = new ChatServiceImpl();


    /**
     * 聊天室页面
     * @param  request
     * @return string
     */
    @RequestMapping(value = "Chat",method = RequestMethod.GET)
    public String create(HttpServletRequest request){
        return "/chat/chat";
    }


    /**
     * Ajax提交 获取新消息
     * @param  lastMsgTime
     * @return ResponseJson
     */
    @RequestMapping(value = "getMessage",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson getMessage(@RequestParam("lastMsgTime") String lastMsgTime){
        List<Chat> chats = chatService.getNewMessage(lastMsgTime);
        ResponseJson responseJson;
        if (chats != null) {

            responseJson = new ResponseJson(0, chats, "成功");

        } else {
            responseJson = new ResponseJson(104, null, "失败");
        }
        return responseJson;
    }


    /**
     * Ajax提交 发送消息
     * @param  message
     * @param  user_id
     * @return ResponseJson
     */
    @RequestMapping(value = "Send",method = RequestMethod.POST)
    @ResponseBody
    public ResponseJson saveMessage(@RequestParam("message") String message, @RequestParam("user_id") int user_id){
        User user  = new User();
        user.setId(user_id);

        Chat chat = new Chat();
        chat.setContent(message);
        chat.setChatByUser(user);
        chatService.savaMessage(chat);
        ResponseJson responseJson;

        responseJson = new ResponseJson(0, null, "成功");

        return responseJson;
    }

}
