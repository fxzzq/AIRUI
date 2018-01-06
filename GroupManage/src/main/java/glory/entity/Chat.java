package glory.entity;


import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 聊天消息实体类
 */
@Entity
@Table(name = "t_chat", schema = "glory", catalog = "")
public class Chat {

    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "content")
    private String content;

    @Basic
    @Column(name = "create_at")
    private String createAt= new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss.SSS").format(new Date());

//    @Basic
//    @Column(name = "user_id")
//    private int userId;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User chatByUser;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }


//    public int getUserId() {
//        return userId;
//    }
//
//    public void setUserId(int userId) {
//        this.userId = userId;
//    }

    public User getChatByUser() {
        return chatByUser;
    }

    public void setChatByUser(User chatByUser) {
        this.chatByUser = chatByUser;
    }
}
