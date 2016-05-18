package demo.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator
 * 下午1:42 16-5-17
 */
public class Class implements Serializable {
    private Integer id;
    private String name;
    private String schedule;
    private Date startDate;
    private Date finishDate;

    public Class() {
    }

    public Class(Integer id, String name, String schedule, Date startDate, Date finishDate) {
        this.id = id;
        this.name = name;
        this.schedule = schedule;
        this.startDate = startDate;
        this.finishDate = finishDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", schedule='" + schedule + '\'' +
                ", startDate=" + startDate +
                ", finishDate=" + finishDate +
                '}';
    }
}
