package demo.dao;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午2:53.
 */
public interface GenericDao<M> {

    void create(M model);

    void remove(int id);

    void update(M aClass);

    List<M> list();

    M search(int id);
}
