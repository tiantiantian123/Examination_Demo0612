package demo.controller;

import demo.model.Teacher;
import demo.service.CourseService;
import demo.service.TeacherService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            session.setAttribute("courses", courseService.list("course.query", teacher.getId()));
            session.setAttribute("classPapers", teacherService.list("teacher.queryClassPaper", null));
            return "redirect:/teacher/teacher.jsp";
        } else {
            request.setAttribute("message", "用户名或密码错误");
            return "/teacher/index";
        }
    }

    @RequestMapping("studentCourse/{paperId}/{classId}/{courseId}")
    private String studentCourse(@PathVariable int paperId, @PathVariable int classId, @PathVariable int courseId) {
        session.setAttribute("paperId", paperId);
        Map<String, Integer> map = new HashMap<>();
        map.put("classId", classId);
        map.put("courseId", courseId);
        session.setAttribute("studentCourses", teacherService.list("teacher.student_course", map));
        return "redirect:/teacher/student_course.jsp";
    }

    @RequestMapping("studentTest/{paperId}/{studentId}")
    private String studentTest(@PathVariable int paperId, @PathVariable int studentId) {
        session.setAttribute("tests", teacherService.list("teacher.tests", paperId));
        Map<String, Integer> map = new HashMap<>();
        map.put("studentId", studentId);
        map.put("paperId", paperId);
        session.setAttribute("studentTests", teacherService.list("teacher.student_test", map));
        return "redirect:/teacher/judge.jsp";
    }
}
