package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.StudentTest;
import demo.service.StudentTestService;

@Service
public class StudentTestServiceImpl extends GenericServiceImpl<StudentTest, Integer> implements StudentTestService {

    @Override
    @Autowired
    @Qualifier("studentTestDaoImpl")
    public void setGenericDao(GenericDao<StudentTest, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}