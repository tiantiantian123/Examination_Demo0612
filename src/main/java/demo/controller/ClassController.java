package demo.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/classController")
public class ClassController extends BaseController {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @RequestMapping("/remove/{id}")
    private void remove(@PathVariable int id) throws IOException {
        System.out.println("id: " + id);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.delete("class.remove", id);
        response.sendRedirect("/class/queryAll");
    }
}
