package demo.model;

/**
 * Created by Administrator
 * 下午1:42 16-5-17
 */
public class Class extends BaseModel {
    private Integer id;
    private String name;
    private String startDate;
    private String finishDate;

    public Class() {
    }

    public Class(Integer id, String name, String startDate, String finishDate) {
        this.id = id;
        this.name = name;
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
                ", startDate='" + startDate + '\'' +
                ", finishDate='" + finishDate + '\'' +
                '}';
    }
}
