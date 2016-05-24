package demo.service.impl;

import demo.dao.GenericDao;
import demo.model.Assistant;
import demo.service.AssistantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class AssistantServiceImpl extends GenericServiceImpl<Assistant, Integer> implements AssistantService {

    @Override
    @Autowired
    @Qualifier("adminDaoImpl")
    void setGenericDao(GenericDao<Assistant, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
