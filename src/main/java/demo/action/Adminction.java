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
public class Adminction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("login")) {
            login(req, resp);
        }
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
                        resp.sendRedirect("/admin/administration.jsp");
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
