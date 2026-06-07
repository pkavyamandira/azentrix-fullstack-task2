package com.azentrix.taskflowpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.azentrix.taskflowpro.entity.TaskCard;
import com.azentrix.taskflowpro.repository.TaskCardRepository;

@Service
public class TaskCardService {

    @Autowired
    private TaskCardRepository taskCardRepository;

    public TaskCard save(TaskCard task) {
        return taskCardRepository.save(task);
    }

    public List<TaskCard> getAllTasks() {
        return taskCardRepository.findAll();
    }
    public List<TaskCard> getTasksByStatus(String status){
        return taskCardRepository.findByStatus(status);
    }
    public TaskCard getTaskById(Long id) {
        return taskCardRepository.findById(id).orElse(null);
    }
    public List<TaskCard> getTasksByOwner(String email){

        return taskCardRepository
                .findByCreatedBy(email);

    }
    public List<TaskCard> getTasksByBoard(Long boardId){

        return taskCardRepository
                .findByBoardId(boardId);

    }
    public List<TaskCard> getTasksByBoardAndStatus(
            Long boardId,
            String status){

        return taskCardRepository
                .findByBoardIdAndStatus(
                        boardId,
                        status);
    }
    public List<TaskCard> getTasksByAssignee(
            String assignee){

        return taskCardRepository
                .findByAssignee(assignee);
    }
}