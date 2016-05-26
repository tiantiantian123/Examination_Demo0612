package demo.service;

import java.io.Serializable;
import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:19.
 */
public interface GenericService<T extends Serializable, ID extends Number> {

    void create(T model);

    void remove(ID id);

    void modify(T model);

    T search(ID id);

    T search(String statement, Object parameter);

    List<T> list();

    List<T> list(String statement, Object parameter);

}
