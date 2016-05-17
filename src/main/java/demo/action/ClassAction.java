package demo.action;

import demo.model.Admin;
import demo.model.Class;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator
 * 下午2:04 16-5-12
 */
@WebServlet(urlPatterns = "/class")
public class ClassAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("create")) {
            create(req, resp);
        }
    }

    protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name").trim();
        String schedule = req.getParameter("schedule").trim();
        String startDate = req.getParameter("startDate");
        String finishDate = req.getParameter("finishDate");

        Class aClass = new Class(null, name, schedule, startDate, finishDate);
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(true)){
            sqlSession.insert("class.create", aClass);
        }

        resp.sendRedirect("/admin/administration.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
