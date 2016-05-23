package demo.controller;

import demo.dao.ClassDao;
import demo.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController {

    @Autowired
    private ClassDao classDao;

    private void list() {
        session.setAttribute("classes", classDao.list());
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
        classDao.create(aClass);
        response.sendRedirect("/class/queryAll");
    }

    @RequestMapping("/search/{id}")
    private void search(@PathVariable int id) throws IOException {
        session.setAttribute("aClass", classDao.search(id));
        response.sendRedirect("/assistant/edit_class.jsp");
    }

    @RequestMapping("/update")
    private void update(Class aClass) throws IOException {
        classDao.update(aClass);
        response.sendRedirect("/class/queryAll");
    }

    @RequestMapping("/remove/{id}")
    private void remove(@PathVariable int id) throws IOException {
        classDao.remove(id);
        response.sendRedirect("/class/queryAll");
    }
}
