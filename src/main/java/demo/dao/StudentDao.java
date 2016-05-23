package demo.dao;

import demo.model.Student;

import java.util.List;

/**
 * Created at 221
 * 16-5-23 下午1:24.
 */
// Student CRUD
public interface StudentDao {

    void create(Student student);

    List<Student> list();

    Student search(int id);

    void update(Student student);

    void remove(int id);

}
