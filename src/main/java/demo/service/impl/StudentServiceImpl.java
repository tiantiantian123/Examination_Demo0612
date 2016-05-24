package demo.service.impl;

import demo.dao.GenericDao;
import demo.dao.StudentDao;
import demo.model.Student;
import demo.service.StudentService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:26.
 */
@Service
public class StudentServiceImpl extends GenericServiceImpl<Student> implements StudentService {

    @Override
    @Autowired
    @Qualifier("studentDaoImpl")
    public void setGenericDao(GenericDao genericDao) {
        super.genericDao = genericDao;
    }

    @Override
    public Student login(HttpServletRequest request, Student student) {
        String plainPassword = student.getPassword();
        StudentDao studentDao = (StudentDao) super.genericDao;
        List<Student> students = studentDao.list("student.login", student.getEmail());
        if (students.size() == 1) {
            student = students.get(0);
            String encryptedPassword = student.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(plainPassword, encryptedPassword)) {
                student.setLastIp(request.getRemoteAddr());
                studentDao.update(student);
                student.setPassword(null);
                return student;
            }
        }
        return null;
    }
}
