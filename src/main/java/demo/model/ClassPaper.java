package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ClassPaper extends BaseModel {

    private Integer id;
    private int classId;
    private int paperId;
    private String time;
    private int assistantId;
    private Class clazz;
    private Paper paper;
}