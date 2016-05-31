package demo.controller;

import demo.model.Paper;
import demo.model.Test;
import demo.service.PaperService;
import demo.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TestController extends BaseController {

    @Autowired
    private TestService testService;

    @Autowired
    private PaperService paperService;

    @RequestMapping("create")
    private String create(Test test) {
        Paper paper = (Paper) session.getAttribute("paper");
        int paperId = paper.getId();
        test.setPaperId(paperId);
        testService.create(test);
        session.setAttribute("paper", paperService.search("paper.query", paperId));
        return "redirect:/teacher/paper.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", testService.list());
        return "redirect:/test/list.jsp";
    }

    @RequestMapping("search/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("test", testService.search(id));
        return "redirect:/test/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Test test) {
        testService.modify(test);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        testService.remove(id);
        return "redirect:/test/list";
    }
}