package demo.service;

import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:19.
 */
public interface GenericService<T> {

    void create(T model);

    void remove(int id);

    void update(T model);

    List<T> list();

    T search(int id);

    List<T> list(String statement, Object parameter);
}
