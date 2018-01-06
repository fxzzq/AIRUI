package glory.service.impl;


import glory.dao.TaskDAO;
import glory.entity.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service
public class TaskServiceImpl implements glory.service.TaskService {

    @Resource
    private TaskDAO taskDAO;


    @Override
    public List<Task> findAll() {
        return taskDAO.findAll();
    }

    @Override
    public Task getTaskById(int id) {
        return taskDAO.findById(id);
    }

    @Override
    public void updateTask(Task task) {
        taskDAO.update(task);
    }

    @Override
    public void saveTask(Task task) {
        taskDAO.save(task);
    }

    @Override
    public void deleteTask(Task task) {
        taskDAO.delete(task);
    }
}
