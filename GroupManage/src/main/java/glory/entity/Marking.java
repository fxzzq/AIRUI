package glory.entity;

import javax.persistence.*;

@Entity
@Table(name = "marking", schema = "glory")
public class Marking {
    @Id
    @GeneratedValue
    private int id;

    @Column(name = "groupname")
    private String groupname;

    @Column(name = "programname")
    private String programname;

    @Column(name = "systemfunctiongrade")
    private  int systemfunctiongrade;

    @Column(name = "techdifficultygrade")
    private  int techdifficultygrade;

    @Column(name = "overallperformancegrade")
    private  int overallperformancegrade;

    @Column(name = "pagelayoutgrade")
    private  int pagelayoutgrade;

    @ManyToOne
    @JoinColumn(name = "marking_id", referencedColumnName = "id")
    private ProgramDetails markingByProgramId;

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

    public int getSystemfunctiongrade() {
        return systemfunctiongrade;
    }

    public void setSystemfunctiongrade(int systemfunctiongrade) {
        this.systemfunctiongrade = systemfunctiongrade;
    }

    public int getTechdifficultygrade() {
        return techdifficultygrade;
    }

    public void setTechdifficultygrade(int techdifficultygrade) {
        this.techdifficultygrade = techdifficultygrade;
    }

    public int getOverallperformancegrade() {
        return overallperformancegrade;
    }

    public void setOverallperformancegrade(int overallperformancegrade) {
        this.overallperformancegrade = overallperformancegrade;
    }

    public int getPagelayoutgrade() {
        return pagelayoutgrade;
    }

    public void setPagelayoutgrade(int pagelayoutgrade) {
        this.pagelayoutgrade = pagelayoutgrade;
    }

    public ProgramDetails getMarkingByProgramId() {
        return markingByProgramId;
    }

    public void setMarkingByProgramId(ProgramDetails markingByProgramId) {
        this.markingByProgramId = markingByProgramId;
    }
}
