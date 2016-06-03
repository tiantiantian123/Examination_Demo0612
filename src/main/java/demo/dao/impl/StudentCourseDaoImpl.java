package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.StudentCourseDao;
import demo.model.StudentCourse;

@Repository
public class StudentCourseDaoImpl extends GenericDaoImpl<StudentCourse, Integer> implements StudentCourseDao {
}