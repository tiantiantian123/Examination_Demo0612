package demo.controller;

import demo.model.StudentCourse;
import demo.service.StudentCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("studentcourse")
public class StudentCourseController extends BaseController {

    @Autowired
    private StudentCourseService studentcourseService;

    @RequestMapping("create")
    private String create(StudentCourse studentcourse) {
        studentcourseService.create(studentcourse);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", studentcourseService.list());
        return "redirect:/studentcourse/list.jsp";
    }

    @RequestMapping("search/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("studentcourse", studentcourseService.search(id));
        return "redirect:/studentcourse/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(StudentCourse studentcourse) {
        studentcourseService.modify(studentcourse);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        studentcourseService.remove(id);
        return "redirect:/studentcourse/list";
    }
}