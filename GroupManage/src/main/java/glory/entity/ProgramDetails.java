package glory.entity;

import javax.persistence.*;



@Entity
@Table(name = "programdetails",schema = "glory" ,catalog = "")
public class ProgramDetails extends BaseEntity {
    private static final long serialVersionUID = -2544170046153290639L;
    @Id
    @GeneratedValue
    private int id;

    @Basic
    @Column(name = "groupname")
    private String groupname;

    @Basic
    @Column(name = "programname")
    private String programname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public String getProgramname() {
        return programname;
    }

    public void setProgramname(String programname) {
        this.programname = programname;
    }
}
