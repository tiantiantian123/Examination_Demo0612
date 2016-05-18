package demo.action;

import demo.model.Admin;
import demo.model.Student;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator
 * 下午2:04 16-5-12
 */
@WebServlet(urlPatterns = "/admin")
public class AdminAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("login")) {
            login(req, resp);
        }
        if (action.equals("create")) {
            create(req, resp);
        }
    }

    protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        String username = req.getParameter("username").trim();
        String password = req.getParameter("password");
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        password = encryptor.encryptPassword(password);
        String role = req.getParameter("role");

        Admin admin = new Admin(null, email, username, password, role);
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(true)){
            sqlSession.insert("admin.create", admin);
        }

        resp.sendRedirect("/admin/system.jsp");
    }
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)) {
            List<Admin> admins = sqlSession.selectList("admin.login", email);
            if (admins.size() == 1) {
                Admin admin = admins.get(0);
                String encryptedPassword = admin.getPassword();
                StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
                if (encryptor.checkPassword(password, encryptedPassword)) {
                    admin.setPassword(null);
                    req.getSession().setAttribute("admin", admin);
                    String role = admin.getRole();
                    if (role.equals("s")) {
                        resp.sendRedirect("/admin/system.jsp");
                    }
                    if (role.equals("t")) {
                        resp.sendRedirect("/admin/teacher.jsp");
                    }
                    if (role.equals("a")) {
                        resp.sendRedirect("/class?action=queryAll");
                    }
                    return;
                }
            }
        }
        req.setAttribute("message", "invalid email or password!");
        req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
    }

    protected void method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
