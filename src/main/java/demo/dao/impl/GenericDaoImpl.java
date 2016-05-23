package demo.dao.impl;

import demo.dao.GenericDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午2:58.
 */
public class GenericDaoImpl<M> implements GenericDao<M> {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Resource
    private SqlSession sqlSession;

    private String namespace;

    public GenericDaoImpl() {
        Class<M> modelClass = (Class<M>) ((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        namespace = modelClass.getSimpleName().toLowerCase();
    }

    @Override
    public void create(M model) {
//        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.insert(namespace + ".create", model);
    }

    @Override
    public void remove(int id) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.delete(namespace + ".remove", id);
    }

    @Override
    public void update(M model) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        sqlSession.update(namespace + ".update", model);
    }

    @Override
    public List<M> list() {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        return sqlSession.selectList(namespace + ".list");
    }

    @Override
    public M search(int id) {
        SqlSession sqlSession = sqlSessionFactory.openSession(false);
        return sqlSession.selectOne(namespace + ".search", id);
    }
}
