package demo.controller;

import demo.model.Student;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 16-5-20.
 */

@Controller
@RequestMapping("/studentController")
public class StudentController {

    @Autowired // 自动装配
    private SqlSessionFactory sqlSessionFactory;

    @RequestMapping("/create")
    private void create(Student student) {
        System.out.println(student);
        student.setLastIp("1.2.3.4");
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        student.setPassword(encryptor.encryptPassword(student.getPassword()));
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert("student.create", student);
    }
}
