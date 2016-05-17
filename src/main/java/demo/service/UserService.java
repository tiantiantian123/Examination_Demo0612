package demo.service;

import demo.model.Student;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator
 * 上午10:44 16-5-16
 */
public class UserService {

    private static void login() {
        Student student = new Student();
        student.setEmail("s1@qq.com");
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)){
            List<Student> students = sqlSession.selectList("student.login", student);
            for (Student s : students) {
                System.out.println(s);
            }
        }
    }

    public static void main(String[] args) {
//        login();

        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        System.out.println(encryptor.encryptPassword("123"));
    }
}
