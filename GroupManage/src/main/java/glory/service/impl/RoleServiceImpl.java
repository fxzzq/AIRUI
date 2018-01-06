package glory.service.impl;

import glory.dao.RoleDAO;
import glory.entity.Role;
import glory.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service
public class RoleServiceImpl implements RoleService{

    @Resource
    private RoleDAO roleDAO;

    @Override
    public List<Role> findAll() {
        return roleDAO.findAll();
    }
}
