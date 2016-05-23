package demo.controller;

import demo.model.Class;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/classController")
public class ClassController extends BaseController {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    private void list() {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        session.setAttribute("classes", sqlSession.selectList("class.queryAll"));
    }

    @RequestMapping("/queryAll")
    private void queryAll() throws IOException {
        list();
        response.sendRedirect("/assistant/assistant.jsp");
    }

    @RequestMapping("/queryAllClasses")
    private void queryAllClasses() throws IOException {
        list();
        response.sendRedirect("/student/sign_up.jsp");
    }

    @RequestMapping("/create")
    private void create(Class aClass) throws IOException {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert("class.create", aClass);
        response.sendRedirect("/class?action=queryAll");
    }

    @RequestMapping("/search/{id}")
    private void search(@PathVariable int id) throws IOException {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        session.setAttribute("aClass", sqlSession.selectOne("class.search", id));
        response.sendRedirect("/assistant/edit_class.jsp");
    }

    @RequestMapping("/update")
    private void update(Class aClass) throws IOException {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.update("class.update", aClass);
        response.sendRedirect("/classController/queryAll");
    }

    @RequestMapping("/remove/{id}")
    private void remove(@PathVariable int id) throws IOException {
        System.out.println("id: " + id);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.delete("class.remove", id);
        session.setAttribute("", "");
        response.sendRedirect("/class?action=queryAll");
    }
}
