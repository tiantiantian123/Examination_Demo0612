package demo.dao.impl;

import demo.dao.GenericDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午2:58.
 */
public class GenericDaoImpl<T extends Serializable, ID extends Number> implements GenericDao<T, ID> {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Resource
    private SqlSession sqlSession;

    private String namespace;

    @SuppressWarnings("unchecked")
    public GenericDaoImpl() {
        Class<T> modelClass;
        modelClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        namespace = modelClass.getSimpleName().toLowerCase();
    }

    @Override
    public void create(T model) {
//        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert(namespace + ".create", model);
    }

    @Override
    public void remove(ID id) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.delete(namespace + ".remove", id);
    }

    @Override
    public void update(T model) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.update(namespace + ".update", model);
    }

    @Override
    public List<T> list() {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        return sqlSession.selectList(namespace + ".list");
    }

    @Override
    public T search(ID id) {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        return sqlSession.selectOne(namespace + ".search", id);
    }

    @Override
    public List<T> list(String statement, Object parameter) {
        return sqlSession.selectList(statement, parameter);
    }
}
