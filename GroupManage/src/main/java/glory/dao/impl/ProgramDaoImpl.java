package glory.dao.impl;


import glory.entity.ProgramDetails;
import glory.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProgramDaoImpl extends BaseDaoImpl<ProgramDetails> implements glory.dao.ProgramDao {

    /**
     * 根据id查找
     * @param  id
     * @return ProgramDetails
     */
    public ProgramDetails findByUser(int id) {
        String hql = "from ProgramDetails where id=?";
        @SuppressWarnings("unchecked")
        List<ProgramDetails> userList =  (List<ProgramDetails>) super.hibernateTemplate.find(hql, id);
        if(userList.size() > 0){
            // 查到数据返回第一个
            System.out.println("hha"+id+"bb"+ userList.size()+"cc"+userList.get(0));
            return userList.get(0);
        }
        return null;
    }
}