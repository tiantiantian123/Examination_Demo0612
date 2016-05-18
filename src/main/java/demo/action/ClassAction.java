package demo.action;

import demo.model.Class;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;

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
        if (action.equals("queryAllClasses")) {
            queryAllClasses(req, resp);
        }
        if (action.equals("queryAll")) {
            queryAll(req, resp);
        }
        if (action.equals("search")) {
            search(req, resp);
        }
        if (action.equals("update")) {
            update(req, resp);
        }
        if (action.equals("remove")) {
            remove(req, resp);
        }
    }

    protected void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)) {
            Class aClass = sqlSession.selectOne("class.search", id);
            req.getSession().setAttribute("aClass", aClass);
        }
        resp.sendRedirect("/admin/edit_class.jsp");
    }

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name").trim();
        String schedule = req.getParameter("schedule").trim();
        String startDate = req.getParameter("startDate");
        String finishDate = req.getParameter("finishDate");

        Class aClass = new Class(id, name, schedule, startDate, finishDate);
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(true)) {
            sqlSession.update("class.update", aClass);
        }
        resp.sendRedirect("/class?action=queryAll");
    }

    protected void remove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(true)) {
            sqlSession.delete("class.remove", id);
        }
        resp.sendRedirect("/class?action=queryAll");
    }

    protected void queryAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listAll(req, resp);
        resp.sendRedirect("/admin/administration.jsp");
    }

    protected void queryAllClasses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listAll(req, resp);
        resp.sendRedirect("/student/sign_up.jsp");
    }

    private void listAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)) {
            List<Class> classes = sqlSession.selectList("class.queryAll");
            req.getSession().setAttribute("classes", classes);
        }
    }

    protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name").trim();
        String schedule = req.getParameter("schedule").trim();
        String startDate = req.getParameter("startDate");
        String finishDate = req.getParameter("finishDate");

        Class aClass = new Class(null, name, schedule, startDate, finishDate);
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(true)) {
            sqlSession.insert("class.create", aClass);
        }

        resp.sendRedirect("/class?action=queryAll");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
