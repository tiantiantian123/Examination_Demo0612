package demo.dao.impl;

import demo.dao.AssistantDao;
import demo.dao.TeacherDao;
import demo.model.Assistant;
import demo.model.Teacher;
import org.springframework.stereotype.Repository;

/**
 * Created at 221
 * 16-5-23 下午6:16.
 */
@Repository
public class AssistantDaoImpl extends GenericDaoImpl<Assistant, Integer> implements AssistantDao {
}
