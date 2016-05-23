package demo.controller;

import demo.model.Assistant;
import demo.util.MyBatisSqlSession;
import org.apache.ibatis.session.SqlSession;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午5:48.
 */
@Controller
@RequestMapping("/assistant")
public class AssistantController extends BaseController {

    @RequestMapping("/login")
    private void login(Assistant assistant) throws IOException, ServletException {
        String password = assistant.getPassword();
        try (SqlSession sqlSession = MyBatisSqlSession.getSqlSession(false)) {
            List<Assistant> assistants = sqlSession.selectList("assistant.login", assistant.getEmail());
            System.out.println(assistants.get(0));
            if (assistants.size() == 1) {
                assistant = assistants.get(0);
                String encryptedPassword = assistant.getPassword();
                StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
                if (encryptor.checkPassword(password, encryptedPassword)) {
                    assistant.setPassword(null);
                    session.setAttribute("assistant", assistant);
                    response.sendRedirect("/class/queryAll");
                    return;
                }
            }
        }
        request.setAttribute("message", "invalid email or password!");
        request.getRequestDispatcher("/assistant/index.jsp").forward(request, response);
    }
}
