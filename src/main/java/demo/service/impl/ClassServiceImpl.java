package demo.service.impl;

import demo.dao.GenericDao;
import demo.model.Class;
import demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class ClassServiceImpl extends GenericServiceImpl<Class> implements ClassService {

    @Override
    @Autowired
    @Qualifier("classDaoImpl")
    void setGenericDao(GenericDao genericDao) {
        super.genericDao = genericDao;
    }
}
