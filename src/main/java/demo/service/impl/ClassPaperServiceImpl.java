package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.ClassPaper;
import demo.service.ClassPaperService;

@Service
public class ClassPaperServiceImpl extends GenericServiceImpl<ClassPaper, Integer> implements ClassPaperService {

    @Override
    @Autowired
    @Qualifier("classPaperDaoImpl")
    public void setGenericDao(GenericDao<ClassPaper, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}