package demo.service.impl;

import demo.dao.AssistantDao;
import demo.dao.GenericDao;
import demo.model.Assistant;
import demo.service.AssistantService;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.xml.ParserContext;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created at 221
 * 16-5-24 上午10:54.
 */
@Service
public class AssistantServiceImpl extends GenericServiceImpl<Assistant, Integer> implements AssistantService {

    @Override
    @Autowired
    @Qualifier("assistantDaoImpl")
    void setGenericDao(GenericDao<Assistant, Integer> genericDao) {
        super.genericDao = genericDao;
    }

    @Override
    public Assistant login(Assistant assistant) {
        String plainPassword = assistant.getPassword();
        AssistantDao assistantDao = (AssistantDao) super.genericDao;
        List<Assistant> assistants = assistantDao.list("assistant.login", assistant.getEmail());
        if (assistants.size() == 1) {
            assistant = assistants.get(0);
            String encryptedPassword = assistant.getPassword();
            StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
            if (encryptor.checkPassword(plainPassword, encryptedPassword)) {
                assistant.setPassword(null);
                return assistant;
            }
        }
        return null;
    }
}
