package ${package}.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ${package}.dao.GenericDao;
import ${package}.model.${model};
import ${package}.service.${model}Service;

@Service
public class ${model}ServiceImpl extends GenericServiceImpl<${model}, ${PK}> implements ${model}Service {

    @Override
    @Autowired
    @Qualifier("${model?uncap_first}DaoImpl")
    public void setGenericDao(GenericDao<${model}, ${PK}> genericDao) {
        super.genericDao = genericDao;
    }
}