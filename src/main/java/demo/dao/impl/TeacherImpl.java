package demo.dao.impl;

import demo.dao.TeacherDao;
import demo.model.Teacher;
import org.springframework.stereotype.Repository;

/**
 * Created at 221
 * 16-5-23 下午6:16.
 */
@Repository
public class TeacherImpl extends GenericDaoImpl<Teacher, Integer> implements TeacherDao {
}
