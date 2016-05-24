package demo.controller;

import demo.dao.AssistantDao;
import demo.model.Assistant;
import demo.service.AssistantService;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午5:48.
 */
@Controller
@RequestMapping("/assistant")
public class AssistantController extends BaseController {

    @Autowired
    private AssistantService assistantService;

    @RequestMapping("/login")
    private String login(Assistant assistant) {
        assistant = assistantService.login(assistant);
        if (assistant != null) {
            session.setAttribute("assistant", assistant);
            return "redirect:/class/queryAll";
        } else {
            request.setAttribute("message", "用户名或密码错误");
            return "/assistant/index";
        }
    }
}
