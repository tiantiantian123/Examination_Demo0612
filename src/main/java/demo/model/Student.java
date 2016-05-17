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
    private String lastIp;
    private String lastLogin;

    public Student() {
    }

    public Student(Integer id, String email, String username, String password, String lastIp, String lastLogin) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.lastIp = lastIp;
        this.lastLogin = lastLogin;
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

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", lastIp='" + lastIp + '\'' +
                ", lastLogin='" + lastLogin + '\'' +
                '}';
    }
}
