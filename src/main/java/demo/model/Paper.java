package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class Paper extends BaseModel {

    private Integer id;
    private int time;
    private int courseId;
    private int teacherId;
    private List<Test> tests;
    private Course course;
}