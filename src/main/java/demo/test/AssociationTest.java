package demo.test;

import demo.model.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created at 221
 * 16-5-26 下午4:24.
 */
public class AssociationTest {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        SqlSession sqlSession = (SqlSession) applicationContext.getBean("sqlSession");
        List<Student> students = sqlSession.selectList("student.test");
        System.out.println(students);
    }
}
