package glory.service.impl;

import glory.dao.MarkingDAO;
import glory.entity.Marking;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional // 开启事务注解
@Service
public class MarkingServiceImpl implements glory.service.MarkingService {

    @Resource
    private MarkingDAO markingDAO;

    public List<Marking> findAll(){
        List<Marking> articles= markingDAO.findAll();
        return articles;
      }


    }











