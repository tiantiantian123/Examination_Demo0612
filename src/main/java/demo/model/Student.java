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

    public Student() {
    }

    public Student(Integer id, String email, String username, String password, String gender, String dob, String tel, String education, String major, String academy, String graduation, String training, String experience, String photo, String remark, String lastIp, String lastLogin, int classId) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.dob = dob;
        this.tel = tel;
        this.education = education;
        this.major = major;
        this.academy = academy;
        this.graduation = graduation;
        this.training = training;
        this.experience = experience;
        this.photo = photo;
        this.remark = remark;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy;
    }

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    public String getTraining() {
        return training;
    }

    public void setTraining(String training) {
        this.training = training;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
                ", gender='" + gender + '\'' +
                ", dob='" + dob + '\'' +
                ", tel='" + tel + '\'' +
                ", education='" + education + '\'' +
                ", major='" + major + '\'' +
                ", academy='" + academy + '\'' +
                ", graduation='" + graduation + '\'' +
                ", training='" + training + '\'' +
                ", experience='" + experience + '\'' +
                ", photo='" + photo + '\'' +
                ", remark='" + remark + '\'' +
                ", lastIp='" + lastIp + '\'' +
                ", lastLogin='" + lastLogin + '\'' +
                ", classId=" + classId +
                '}';
    }
}
