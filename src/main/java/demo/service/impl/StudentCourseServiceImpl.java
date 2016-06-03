package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.StudentCourse;
import demo.service.StudentCourseService;

@Service
public class StudentCourseServiceImpl extends GenericServiceImpl<StudentCourse, Integer> implements StudentCourseService {

    @Override
    @Autowired
    @Qualifier("studentCourseDaoImpl")
    public void setGenericDao(GenericDao<StudentCourse, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}