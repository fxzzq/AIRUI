package glory.service.impl;


import glory.dao.MarkingDAO;
import glory.dao.ProgramDao;
import glory.entity.Marking;
import glory.entity.ProgramDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional // 开启事务注解
@Service
public class ProgramDetailsServiceImpl implements glory.service.ProgramDetailsService {
    @Resource
    private ProgramDao programDao;

    @Resource
    private MarkingDAO  markingDAO;

    public List<ProgramDetails> findAll(){
        List<ProgramDetails> articles= programDao.findAll();
        return articles;
    }

    public ProgramDetails getProgramDetailsById(int id){
         ProgramDetails article =programDao.findById(id);
        return article;
    }

    public void updateProgramDetails(ProgramDetails article){
        programDao.update(article);
    }

    @Override
    public void submitmarkingInfo(Marking article1){
        markingDAO.save(article1);

    }

    public ProgramDetails  findByUser(int ID ){
        return  programDao.findByUser(ID);
    }
 /*   public void saveArticle(ProgramDetails article) {

        programDao.save(article);
    }*/

  /*  @Override
    public void deleteArticle(ProgramDetails article) {
        programDao.delete(article);
    }*/
}







