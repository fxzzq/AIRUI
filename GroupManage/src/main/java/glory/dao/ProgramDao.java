package glory.dao;


import glory.entity.ProgramDetails;


public interface ProgramDao extends BaseDao<ProgramDetails>{
    ProgramDetails  findByUser(int id);
}