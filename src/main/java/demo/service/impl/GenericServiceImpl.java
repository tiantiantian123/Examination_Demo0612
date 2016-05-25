package demo.service.impl;

import demo.dao.GenericDao;
import demo.service.GenericService;

import java.io.Serializable;
import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:20.
 */
public abstract class GenericServiceImpl<T extends Serializable, ID extends Number> implements GenericService<T, ID> {

    GenericDao<T, ID> genericDao;

    abstract void setGenericDao(GenericDao<T, ID> genericDao);

    @Override
    public void create(T model) {
        genericDao.create(model);
    }

    @Override
    public void remove(ID id) {
        genericDao.remove(id);
    }

    @Override
    public void modify(T model) {
        genericDao.modify(model);
    }

    @Override
    public List<T> list() {
        return genericDao.list();
    }

    @Override
    public T search(ID id) {
        return genericDao.search(id);
    }

    @Override
    public List<T> list(String statement, Object parameter) {
        return genericDao.list(statement, parameter);
    }
}
