package glory.entity;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Group类
 */
@Entity
@Table(name = "t_groups", schema = "glory", catalog = "")
public class Group {


    @Id
    @Column(name = "id")
    private int id ;

    @Basic
    @Column(name = "group_name")
    private String groupName;

    @Basic
    @Column(name = "leader_id")
    private int leaderId;

    @Basic
    @Column(name = "create_at")
    private String createAt = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss").format(new Date());

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public int getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(int leaderId) {
        this.leaderId = leaderId;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }
}
