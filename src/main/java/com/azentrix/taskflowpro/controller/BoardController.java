package com.azentrix.taskflowpro.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.azentrix.taskflowpro.entity.Board;
import com.azentrix.taskflowpro.entity.User;
import com.azentrix.taskflowpro.service.BoardService;

@Controller
public class BoardController {

@Autowired
private BoardService boardService;

@GetMapping("/boards")
public String boards(
        Model model,
        HttpSession session) {

    User user =
            (User) session.getAttribute("loggedUser");

    if(user == null ||
       !"ADMIN".equals(user.getRole())) {

        return "redirect:/dashboard";
    }

    model.addAttribute(
            "boards",
            boardService.getAllBoards());

    return "boards";
}

@PostMapping("/saveBoard")
public String saveBoard(
        @RequestParam String boardName,
        HttpSession session) {

    User user =
            (User) session.getAttribute("loggedUser");

    if(user == null ||
       !"ADMIN".equals(user.getRole())) {

        return "redirect:/dashboard";
    }

    Board board = new Board();
    board.setBoardName(boardName);

    boardService.saveBoard(board);

    return "redirect:/boards";
}

@GetMapping("/deleteBoard/{id}")
public String deleteBoard(
        @PathVariable Long id,
        HttpSession session) {

    User user =
            (User) session.getAttribute("loggedUser");

    if(user == null ||
       !"ADMIN".equals(user.getRole())) {

        return "redirect:/dashboard";
    }

    boardService.deleteBoard(id);

    return "redirect:/boards";
}


}
