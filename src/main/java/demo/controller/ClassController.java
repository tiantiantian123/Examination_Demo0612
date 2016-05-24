package demo.controller;

import demo.dao.ClassDao;
import demo.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController {

    @Autowired
    private ClassDao classDao;

    private void list() {
        session.setAttribute("classes", classDao.list());
    }

    @RequestMapping("/queryAll")
    private String queryAll() {
        list();
        return "redirect:/assistant/assistant.jsp";
    }

    @RequestMapping("/queryAllClasses")
    private String queryAllClasses() {
        list();
        return "redirect:/student/sign_up.jsp";
    }

    @RequestMapping("/create")
    private String create(Class aClass) {
        classDao.create(aClass);
        return "redirect:/class/queryAll";
    }

    @RequestMapping("/search/{id}")
    private String search(@PathVariable int id) {
        session.setAttribute("aClass", classDao.search(id));
        return "redirect:/assistant/edit_class.jsp";
    }

    @RequestMapping("/update")
    private String update(Class aClass) {
        classDao.update(aClass);
        return "redirect:/class/queryAll";
    }

    @RequestMapping("/remove/{id}")
    private String remove(@PathVariable int id) {
        classDao.remove(id);
        return "redirect:/class/queryAll";
    }
}
