package demo.service.impl;

import demo.dao.GenericDao;
import demo.service.GenericService;

import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:20.
 */
public abstract class GenericServiceImpl<T> implements GenericService<T> {

    GenericDao<T> genericDao;

    abstract void setGenericDao(GenericDao genericDao);

    @Override
    public void create(T model) {
        genericDao.create(model);
    }

    @Override
    public void remove(int id) {
        genericDao.remove(id);
    }

    @Override
    public void update(T model) {
        genericDao.update(model);
    }

    @Override
    public List<T> list() {
        return genericDao.list();
    }

    @Override
    public T search(int id) {
        return genericDao.search(id);
    }

    @Override
    public List<T> list(String statement, Object parameter) {
        return genericDao.list(statement, parameter);
    }
}
