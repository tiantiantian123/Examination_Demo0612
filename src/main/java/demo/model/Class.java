package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * Created by Administrator
 * 下午1:42 16-5-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class Class extends BaseModel {
    private Integer id;
    private String name;
    private String startDate;
    private String finishDate;

    // one to many
    private List<Student> students;
}
