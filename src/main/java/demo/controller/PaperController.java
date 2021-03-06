package demo.controller;

import demo.model.Paper;
import demo.model.Teacher;
import demo.service.ClassPaperService;
import demo.service.CourseService;
import demo.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("paper")
public class PaperController extends BaseController {

    @Autowired
    private PaperService paperService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ClassPaperService classPaperService;

    @RequestMapping("create")
    private String create(Paper paper) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherId = teacher.getId();
        paper.setTeacherId(teacherId);
        paperService.create(paper);
        session.setAttribute("courses", courseService.list("course.query", teacherId));
        return "redirect:/teacher/teacher.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", paperService.list());
        return "redirect:/paper/list.jsp";
    }

    @RequestMapping("list/{id}")
    private String list(@PathVariable int id) {
        session.setAttribute("classId", id);
        session.setAttribute("papers", paperService.list("paper.papers", null));
        session.setAttribute("classPapers", classPaperService.list("classpaper.queryByClassId", id));
        return "redirect:/assistant/edit_test.jsp";
    }

    @RequestMapping("search/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("paper", paperService.search(id));
        return "redirect:/paper/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Paper paper) {
        paperService.modify(paper);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        paperService.remove(id);
        return "redirect:/paper/list";
    }

    @RequestMapping("query/{id}")
    private String query(@PathVariable int id) {
        session.setAttribute("paper", paperService.search("paper.query", id));
        return "redirect:/teacher/paper.jsp";
    }

    @RequestMapping("studentQuery/{id}")
    private String studentQuery(@PathVariable int id) {
        session.setAttribute("paper", paperService.search("paper.query", id));
        return "redirect:/student/examination.jsp";
    }
}