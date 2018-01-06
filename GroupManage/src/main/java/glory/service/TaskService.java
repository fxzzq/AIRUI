package glory.service;

import glory.entity.Task;

import java.util.List;

public interface TaskService {

    List<Task> findAll();

    Task getTaskById(int id);

    void updateTask(Task article);

    void saveTask(Task article);

    void deleteTask(Task article);

}
