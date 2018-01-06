package glory.service;

import glory.entity.Article;
import glory.entity.Marking;
import glory.entity.ProgramDetails;

import java.util.List;

public interface ProgramDetailsService {

    List<ProgramDetails> findAll();
    ProgramDetails getProgramDetailsById(int id);
    void submitmarkingInfo(Marking article);
    ProgramDetails  findByUser(int ID );
}
