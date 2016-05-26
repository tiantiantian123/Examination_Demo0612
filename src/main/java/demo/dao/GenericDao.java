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

    T search(ID id);

    T search(String statement, Object parameter);

    List<T> list();

    List<T> list(String statement, Object parameter);

}
