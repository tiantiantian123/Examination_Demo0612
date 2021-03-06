package demo.service.impl;

import demo.dao.GenericDao;
import demo.dao.TeacherDao;
import demo.model.Teacher;
import demo.service.TeacherService;
import demo.util.Encryptor;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class TeacherServiceImpl extends GenericServiceImpl<Teacher, Integer> implements TeacherService {

    @Override
    @Autowired
    @Qualifier("teacherDaoImpl")
    void setGenericDao(GenericDao<Teacher, Integer> genericDao) {
        super.genericDao = genericDao;
    }

    @Override
    public Teacher login(Teacher teacher) {
        String plainPassword = teacher.getPassword();
        TeacherDao teacherDao = (TeacherDao) super.genericDao;
        List<Teacher> teachers = teacherDao.list("teacher.login", teacher.getEmail());
        if (teachers.size() == 1) {
            teacher = teachers.get(0);
            String encryptedPassword = teacher.getPassword();
            if (Encryptor.getEncryptor().checkPassword(plainPassword, encryptedPassword)) {
                teacher.setPassword(null);
                return teacher;
            }
        }
        return null;
    }
}
