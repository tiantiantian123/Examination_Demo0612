package demo.controller;

import demo.model.Class;
import demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController {

    @Autowired
    private ClassService classService;

    private void list() {
        session.setAttribute("classes", classService.list());
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
        classService.create(aClass);
        return "redirect:/class/queryAll";
    }

    @RequestMapping("/search/{id}")
    private String search(@PathVariable int id) {
        session.setAttribute("aClass", classService.search(id));
        return "redirect:/assistant/edit_class.jsp";
    }

    @RequestMapping("/modify")
    private String modify(Class aClass) {
        classService.modify(aClass);
        return "redirect:/class/queryAll";
    }

    @RequestMapping("/remove/{id}")
    private String remove(@PathVariable int id) {
        classService.remove(id);
        return "redirect:/class/queryAll";
    }

    @RequestMapping("students/{id}")
    private String students(@PathVariable int id) {
        session.setAttribute("aClass", classService.search("class.students", id));
        return "redirect:/assistant/edit_student.jsp";
    }
}
