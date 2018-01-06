package glory.service;

import glory.entity.Group;
import glory.entity.User;

import java.util.List;

public interface GroupService {

    List<Group> findAll();

    Group getGroupByid(int id);

    void updateGroup(Group group);

    void saveGroup(Group group);

    void deleteGroup(Group group);

}
