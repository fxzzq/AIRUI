package glory.entity;

import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 任务实体类
 */
@Entity
@DynamicInsert
@Table(name = "t_task", schema = "glory", catalog = "")
public class Task {

    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "description")
    private String description;

    @Basic
    @Column(name = "status",columnDefinition="varchar default 未完成")
    private String status;

    @Basic
    @Column(name = "receiver_id")
    private int receiverId;

    @Basic
    @Column(name = "post_id")
    private int postId;


    @Basic
    @Column(name = "create_at")
    private String createAt = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss").format(new Date());

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getStatus() {
        return status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String describe) {
        this.description = describe;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }
}
