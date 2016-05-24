package demo.controller;

import demo.model.Admin;
import demo.model.Assistant;
import demo.model.Teacher;
import demo.service.AdminService;
import demo.service.AssistantService;
import demo.service.TeacherService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午6:08.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AssistantService assistantService;

    @RequestMapping("/login")
    private String login(Admin admin) {
        admin = adminService.login(admin);
        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/admin/admin.jsp";
        } else {
            request.setAttribute("message", "invalid email or password!");
            return "/admin/index";
        }
    }

    @RequestMapping("/createTeacher")
    private String createTeacher(Teacher teacher) {
        teacherService.create(teacher);
        return "redirect:/admin/admin.jsp";
    }

    @RequestMapping("/createAssistant")
    private String createAssistant(Assistant assistant) {
        assistantService.create(assistant);
        return "redirect:/admin/admin.jsp";
    }
}
