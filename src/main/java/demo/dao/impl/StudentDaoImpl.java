package demo.dao.impl;

import demo.dao.StudentDao;
import demo.model.Student;
import org.springframework.stereotype.Repository;

/**
 * Created at 221
 * 16-5-23 下午1:25.
 */
@Repository
public class StudentDaoImpl extends GenericDaoImpl<Student> implements StudentDao {
}