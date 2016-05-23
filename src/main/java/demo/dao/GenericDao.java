package demo.dao;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午2:53.
 */
public interface GenericDao<T> {

    void create(T model);

    void remove(int id);

    void update(T aClass);

    List<T> list();

    T search(int id);

    List<T> list(String statement, Object parameter);
}
