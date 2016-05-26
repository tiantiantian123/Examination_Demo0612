package demo.service.impl;

import demo.dao.AdminDao;
import demo.dao.GenericDao;
import demo.model.Admin;
import demo.service.AdminService;
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
public class AdminServiceImpl extends GenericServiceImpl<Admin, Integer> implements AdminService {

    @Override
    @Autowired
    @Qualifier("adminDaoImpl")
    void setGenericDao(GenericDao<Admin, Integer> genericDao) {
        super.genericDao = genericDao;
    }

    @Override
    public Admin login(Admin admin) {
        String plainPassword = admin.getPassword();
        AdminDao adminDao = (AdminDao) super.genericDao;
        List<Admin> admins = adminDao.list("admin.login", admin.getEmail());
        if (admins.size() == 1) {
            admin = admins.get(0);
            String encryptedPassword = admin.getPassword();
            if (Encryptor.getEncryptor().checkPassword(plainPassword, encryptedPassword)) {
                admin.setPassword(null);
                return admin;
            }
        }
        return null;
    }
}
