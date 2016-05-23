package demo.dao.impl;

import demo.dao.StudentDao;
import demo.model.Student;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午1:25.
 */
@Repository
public class StudentDaoImpl implements StudentDao {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;


    @Override
    public void create(Student student) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert("student.create", student);
    }

    @Override
    public List<Student> list() {
        return null;
    }

    @Override
    public Student search(int id) {
        return null;
    }

    @Override
    public void update(Student student) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.update("student.update", student);
    }

    @Override
    public void remove(int id) {

    }
}
