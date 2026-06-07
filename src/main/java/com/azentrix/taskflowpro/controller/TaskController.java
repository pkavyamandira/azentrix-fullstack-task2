package com.azentrix.taskflowpro.controller;
import jakarta.servlet.http.HttpSession;

import com.azentrix.taskflowpro.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.azentrix.taskflowpro.entity.Board;
import com.azentrix.taskflowpro.entity.TaskCard;
import com.azentrix.taskflowpro.service.TaskCardService;
import com.azentrix.taskflowpro.repository.BoardRepository;
@Controller
public class TaskController {

    @Autowired
    private TaskCardService taskCardService;

    @GetMapping("/tasks/{boardId}")
    public String tasks(
            @PathVariable Long boardId,
            Model model,
            HttpSession session){

        Board board =
                boardRepository
                .findById(boardId)
                .orElse(null);

        model.addAttribute("board", board);

        model.addAttribute(
                "boardId",
                boardId);

        model.addAttribute(
                "tasks",
                taskCardService
                .getTasksByBoard(boardId));

        return "tasks";
    }
    
    @Autowired
    private BoardRepository boardRepository;
    @PostMapping("/saveTask")
    public String saveTask(
            TaskCard taskCard,
            @RequestParam Long boardId){

        Board board =
                boardRepository
                .findById(boardId)
                .orElse(null);

        taskCard.setBoard(board);

        taskCardService.save(taskCard);

        return "redirect:/tasks/" + boardId;
    }
    
    @GetMapping("/kanban/{boardId}")
    public String kanban(
            @PathVariable Long boardId,
            Model model){

        model.addAttribute(
                "boardId",
                boardId);

        model.addAttribute(
                "todoTasks",
                taskCardService
                .getTasksByBoardAndStatus(
                        boardId,
                        "TODO"));

        model.addAttribute(
                "progressTasks",
                taskCardService
                .getTasksByBoardAndStatus(
                        boardId,
                        "IN_PROGRESS"));

        model.addAttribute(
                "doneTasks",
                taskCardService
                .getTasksByBoardAndStatus(
                        boardId,
                        "DONE"));

        return "kanban";
    }
    
    @GetMapping("/myTasks")
    public String myTasks(
            Model model,
            HttpSession session){

        User user =
                (User)session.getAttribute(
                        "loggedUser");

        if(user == null){

            return "redirect:/";
        }

        if("ADMIN".equals(user.getRole())){

            model.addAttribute(
                    "tasks",
                    taskCardService.getAllTasks());

        }else{

            String assignee =
                    user.getName();

            model.addAttribute(
                    "tasks",
                    taskCardService
                            .getTasksByAssignee(
                                    assignee));
        }

        return "myTasks";
    }
    
    @GetMapping("/completeTask/{id}")
    public String completeTask(
            @PathVariable Long id){

        TaskCard task =
                taskCardService
                .getTaskById(id);

        if(task != null){

            task.setStatus("DONE");

            taskCardService.save(task);
        }

        return "redirect:/myTasks";
    }
}