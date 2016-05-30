package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class Paper extends BaseModel {

    private Integer id;
    private String title;
    private int time;
    private int courseId;
    private int teacherId;
}