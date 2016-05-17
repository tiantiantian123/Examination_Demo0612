package demo.model;

import java.io.Serializable;

/**
 * Created by Administrator
 * 下午1:42 16-5-17
 */
public class Class implements Serializable {
    private Integer id;
    private String name;
    private String schedule;
    private String startDate;
    private String finishDate;

    public Class() {
    }

    public Class(Integer id, String name, String schedule, String startDate, String finishDate) {
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

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", schedule='" + schedule + '\'' +
                ", startDate='" + startDate + '\'' +
                ", finishDate='" + finishDate + '\'' +
                '}';
    }
}
