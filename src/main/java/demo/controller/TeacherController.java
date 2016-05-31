package demo.controller;

import demo.model.Teacher;
import demo.service.CourseService;
import demo.service.TeacherService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午5:34.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @RequestMapping("/login")
    private String login(Teacher teacher) {
        teacher = teacherService.login(teacher);
        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            session.setAttribute("allCourses", courseService.list());
            session.setAttribute("courses", courseService.list("course.query", teacher.getId()));
            return "redirect:/teacher/teacher.jsp";
        } else {
            request.setAttribute("message", "用户名或密码错误");
            return "/teacher/index";
        }
    }
}
