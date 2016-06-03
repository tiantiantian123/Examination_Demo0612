package demo.model;

import lombok.*;

import java.util.Date;
import java.util.List;

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
    private Date lastLogin;
    private int classId;

    // many to one
    private Class clazz;
    // one to one
    private IP ip;
    // one to many
    private List<StudentCourse> studentCourses;
}
