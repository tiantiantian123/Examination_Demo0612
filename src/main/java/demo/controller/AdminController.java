package demo.controller;

import demo.dao.AdminDao;
import demo.dao.AssistantDao;
import demo.dao.TeacherDao;
import demo.model.Admin;
import demo.model.Assistant;
import demo.model.Teacher;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.PreUpdate;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午6:08.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @Autowired
    private AdminDao adminDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private AssistantDao assistantDao;

    @RequestMapping("/login")
    private String login(Admin admin) {
        String password = admin.getPassword();
        List<Admin> admins = adminDao.list("admin.login", admin.getEmail());
        if (admins.size() == 1) {
            admin = admins.get(0);
            String encryptedPassword = admin.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(password, encryptedPassword)) {
                admin.setPassword(null);
                session.setAttribute("admin", admin);
                return "redirect:/admin/admin.jsp";
            }
        }
        request.setAttribute("message", "invalid email or password!");
        return "/admin/index";
    }

    @RequestMapping("/createTeacher")
    private String createTeacher(Teacher teacher) {
        teacherDao.create(teacher);
        return "redirect:/admin/admin.jsp";
    }

    @RequestMapping("/createAssistant")
    private String createAssistant(Assistant assistant) {
        assistantDao.create(assistant);
        return "redirect:/admin/admin.jsp";
    }
}
