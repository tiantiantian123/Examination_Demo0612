package demo.service;

import demo.model.Student;

import javax.servlet.http.HttpServletRequest;

/**
 * Created at 221
 * 16-5-24 上午10:25.
 */
public interface StudentService extends GenericService<Student> {

    Student login(HttpServletRequest request, Student student);
}
