package glory.entity;


import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * User实体类
 */
@Entity
@Table(name = "t_users", schema = "glory", catalog = "")
public class User extends BaseEntity {

    private static final long serialVersionUID = -2544170046153290639L;

    @Id
    @Column(name = "id")
    private int id;

    @Basic
    @Column(name = "email")
    private String email;

    @Basic
    @Column(name = "password")
    private String password;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "role_id",nullable = true)
    private int roleId;

    @Basic
    @Column(name = "group_id")
    private int groupId;

    @Basic
    @Column(name = "create_at")
    private String createAt = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss").format(new Date());


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

}
