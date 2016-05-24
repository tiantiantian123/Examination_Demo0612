package demo.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by Administrator on 16-5-19.
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class Admin extends BaseModel {
    private Integer id;
    private String email;
    private String username;
    private String password;
}
