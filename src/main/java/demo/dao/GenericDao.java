package demo.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午2:53.
 */
public interface GenericDao<T extends Serializable, ID extends Number> {

    void create(T model);

    void remove(ID id);

    void modify(T model);

    List<T> list();

    T search(ID id);

    List<T> list(String statement, Object parameter);
}
