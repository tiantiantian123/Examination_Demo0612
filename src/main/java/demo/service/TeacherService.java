package demo.service;

import demo.model.Teacher;

/**
 * Created at 221
 * 16-5-24 上午10:53.
 */
public interface TeacherService extends GenericService<Teacher, Integer> {
    Teacher login(Teacher teacher);
}
