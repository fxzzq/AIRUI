package glory.service;

import glory.entity.Chat;

import java.util.List;

public interface ChatService {

    public List<Chat> getNewMessage(String preMsgTime);

    public void savaMessage(Chat chat);
}
