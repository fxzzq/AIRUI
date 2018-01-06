package glory.service.impl;

import glory.dao.GroupDAO;
import glory.dao.UserDao;
import glory.entity.Group;
import glory.entity.User;
import glory.service.GroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service
public class GroupServiceImpl implements GroupService{

    @Resource
    GroupDAO groupDAO;

    @Override
    public List<Group> findAll() {
//        String hql="from Group left join Group.leaderId ";
//        return groupDAO.find(hql);
        return groupDAO.findAll();
    }

    @Override
    public Group getGroupByid(int id) {
        return groupDAO.findById(id);
    }

    @Override
    public void updateGroup(Group group) {
         groupDAO.update(group);
    }

    @Override
    public void saveGroup(Group group) {
        groupDAO.save(group);
    }

    @Override
    public void deleteGroup(Group group) {
        groupDAO.delete(group);
    }


}
