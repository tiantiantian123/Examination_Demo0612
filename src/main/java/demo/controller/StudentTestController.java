package demo.controller;

import demo.model.Paper;
import demo.model.Student;
import demo.model.StudentTest;
import demo.model.Test;
import demo.service.StudentTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("studenttest")
public class StudentTestController extends BaseController {

    @Autowired
    private StudentTestService studenttestService;

    @RequestMapping("create")
    private String create() {
        Student student = (Student) session.getAttribute("student");
        int studentId = student.getId();
        Paper paper = (Paper) session.getAttribute("paper");
        List<Test> tests = paper.getTests();
        for (Test test : tests) {
            int testId = test.getId();
            String key = String.valueOf(testId);
            String answer = request.getParameter(key);
            StudentTest studentTest = new StudentTest(null, studentId, testId, answer, null);
            studenttestService.create(studentTest);
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", studenttestService.list());
        return "redirect:/studenttest/list.jsp";
    }

    @RequestMapping("search/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("studenttest", studenttestService.search(id));
        return "redirect:/studenttest/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(StudentTest studenttest) {
        studenttestService.modify(studenttest);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        studenttestService.remove(id);
        return "redirect:/studenttest/list";
    }
}