package com.azentrix.taskflowpro.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.azentrix.taskflowpro.entity.TaskCard;

public interface TaskCardRepository extends JpaRepository<TaskCard, Long> {

    List<TaskCard> findByStatus(String status);
    List<TaskCard> findByCreatedBy(String createdBy);
    List<TaskCard> findByAssignee(String assignee);
    List<TaskCard> findByBoardId(Long boardId);
    List<TaskCard> findByBoardIdAndStatus(
            Long boardId,
            String status);

}