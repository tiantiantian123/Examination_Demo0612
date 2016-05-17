package demo.model;

import java.io.Serializable;

/**
 * Created by non-perfectionist
 * 9:41 2016/5/16.
 */
public class Student implements Serializable {
    private Integer id;
    private String email;
    private String username;
    private String password;
    private String photo;
    private String lastIp;
    private String lastLogin;
    private int classId;

    public Student() {
    }

    public Student(Integer id, String email, String username, String password, String photo, String lastIp, String lastLogin, int classId) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.photo = photo;
        this.lastIp = lastIp;
        this.lastLogin = lastLogin;
        this.classId = classId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", photo='" + photo + '\'' +
                ", lastIp='" + lastIp + '\'' +
                ", lastLogin='" + lastLogin + '\'' +
                ", classId=" + classId +
                '}';
    }
}
