package demo.service.impl;

import demo.dao.GenericDao;
import demo.model.Admin;
import demo.model.Class;
import demo.service.AdminService;
import demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class AdminServiceImpl extends GenericServiceImpl<Admin> implements AdminService {

    @Override
    @Autowired
    @Qualifier("adminDaoImpl")
    void setGenericDao(GenericDao<Admin> genericDao) {
        super.genericDao = genericDao;
    }
}
