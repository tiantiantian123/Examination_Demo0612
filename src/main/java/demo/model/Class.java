package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

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
}
