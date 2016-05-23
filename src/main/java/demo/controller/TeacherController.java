package demo.controller;

import demo.model.Teacher;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午5:34.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @RequestMapping("/login")
    private String login(Teacher teacher) {
        String password = teacher.getPassword();
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)) {
            List<Teacher> teachers = sqlSession.selectList("teacher.login", teacher.getEmail());
            System.out.println(teachers.get(0));
            if (teachers.size() == 1) {
                teacher = teachers.get(0);
                String encryptedPassword = teacher.getPassword();
                StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
                if (encryptor.checkPassword(password, encryptedPassword)) {
                    teacher.setPassword(null);
                    session.setAttribute("teacher", teacher);
                    return "redirect:/teacher/teacher.jsp";
                }
            }
        }
        request.setAttribute("message", "用户名或密码错误");
        return "/teacher/index";
    }
}
