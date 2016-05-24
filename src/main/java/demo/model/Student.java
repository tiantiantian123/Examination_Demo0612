package demo.model;

import lombok.*;

/**
 * Created by non-perfectionist
 * 9:41 2016/5/16.
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class Student extends BaseModel {
    private Integer id;
    private String email;
    private String username;
    private String password;
    private String gender;
    private String dob;
    private String tel;
    private String education;
    private String major;
    private String academy;
    private String graduation;
    private String training;
    private String experience;
    private String photo;
    private String remark;
    private String lastIp;
    private String lastLogin;
    private int classId;
}
