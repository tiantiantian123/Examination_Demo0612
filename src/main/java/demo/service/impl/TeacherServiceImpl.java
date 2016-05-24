package demo.service.impl;

import demo.dao.GenericDao;
import demo.model.Teacher;
import demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class TeacherServiceImpl extends GenericServiceImpl<Teacher> implements TeacherService {

    @Override
    @Autowired
    @Qualifier("adminDaoImpl")
    void setGenericDao(GenericDao<Teacher> genericDao) {
        super.genericDao = genericDao;
    }
}
