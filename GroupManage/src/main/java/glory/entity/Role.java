package glory.entity;


import javax.persistence.*;

/**
 * Role类
 */
@Entity
@Table(name = "t_roles", schema = "glory", catalog = "")
public class Role {


    @Id
    @Column(name = "id")
    private int id;


    @Basic
    @Column(name = "role_name")
    private String roleName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
