package glory.service.impl;

import glory.dao.ChatDAO;
import glory.dao.impl.ChatDAOImpl;
import glory.entity.Chat;
import glory.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@org.springframework.transaction.annotation.Transactional
@Service
public class ChatServiceImpl implements ChatService {

    @Autowired(required = true)
    private ChatDAO chatDAO = new ChatDAOImpl();



    public List<Chat> getNewMessage(String preMsgTime){
        String hql="from Chat where createAt > ?";
        return chatDAO.find(hql,preMsgTime);
    }

    @Override
    @Transactional
    public void savaMessage(Chat chat) {
        chatDAO.save(chat);
    }
}
