package demo.ioc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator
 * 上午9:29 16-5-18
 */
public class Test {

    public static void main(String[] args) {
//        Business business = new Business(new FloppyWriter());
//        Business business = new Business(new USBWriter());
//        business.saveData();

//        Business business = new Business();
//        business.setDeviceWriter(new FloppyWriter());
//        business.saveData();

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//        Business business = (Business) applicationContext.getBean("business");
//        business.saveData();

        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.delete("class.remove", 1);
    }
}
