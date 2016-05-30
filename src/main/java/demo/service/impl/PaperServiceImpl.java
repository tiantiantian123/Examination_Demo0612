package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Paper;
import demo.service.PaperService;

@Service
public class PaperServiceImpl extends GenericServiceImpl<Paper, Integer> implements PaperService {

    @Override
    @Autowired
    @Qualifier("paperDaoImpl")
    public void setGenericDao(GenericDao<Paper, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}