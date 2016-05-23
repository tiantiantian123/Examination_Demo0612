package demo.dao.impl;

import demo.dao.ClassDao;
import demo.model.Class;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 上午10:45.
 */
@Repository
public class ClassDaoImpl implements ClassDao {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public void create(Class aClass) {
        System.out.println("MyBatis create...");
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert("class.create", aClass);
    }

    @Override
    public List<Class> list() {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        List<Class> classes = sqlSession.selectList("class.queryAll");
        return classes;
    }
}
