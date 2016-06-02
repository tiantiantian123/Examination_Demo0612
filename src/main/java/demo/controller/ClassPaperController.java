package demo.controller;

import demo.model.Assistant;
import demo.model.ClassPaper;
import demo.service.ClassPaperService;
import demo.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("classpaper")
public class ClassPaperController extends BaseController {

    @Autowired
    private ClassPaperService classpaperService; // TODO: 16-6-2 controller.ftl

    @Autowired
    private PaperService paperService;

    @RequestMapping("create")
    private String create(ClassPaper classPaper) {
        Assistant assistant = (Assistant) session.getAttribute("assistant");
        classPaper.setAssistantId(assistant.getId());
        classpaperService.create(classPaper);
        session.setAttribute("classPapers", classpaperService.list("classpaper.query", null));
        return "redirect:/assistant/edit_test.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", classpaperService.list());
        return "redirect:/classpaper/list.jsp";
    }

    @RequestMapping("search/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("classpaper", classpaperService.search(id));
        return "redirect:/assistant/edit_class_paper.jsp";
    }

    @RequestMapping("modify")
    private String modify(ClassPaper classpaper) {
        classpaperService.modify(classpaper);
        session.setAttribute("papers", paperService.list("paper.papers", null));
        session.setAttribute("classPapers", classpaperService.list("classpaper.queryByClassId", classpaper.getClassId()));
        return "redirect:/assistant/edit_test.jsp";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        classpaperService.remove(id);
        return "redirect:/classpaper/list";
    }
}