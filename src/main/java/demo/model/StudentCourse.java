package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class StudentCourse extends BaseModel {

    private Integer id;
    private int studentId;
    private int courseId;
    private Integer grade;
    private Course course;
}