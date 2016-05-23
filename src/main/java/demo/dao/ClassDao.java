package demo.dao;

import demo.model.Class;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 上午10:28.
 */
// Class CRUD
public interface ClassDao {

    void create(Class aClass);

    List<Class> list();

    Class search(int id);

    void update(Class aClass);

    void remove(int id);

}
