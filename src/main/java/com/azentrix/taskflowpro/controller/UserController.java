package com.azentrix.taskflowpro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.azentrix.taskflowpro.entity.User;
import com.azentrix.taskflowpro.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/users")
    public String users(Model model){

        List<User> users =
                userRepository.findAll();

        model.addAttribute(
                "users",
                users);

        return "users";
    }

    @GetMapping("/deleteUser/{id}")
    public String deleteUser(
            @PathVariable Long id){

        userRepository.deleteById(id);

        return "redirect:/users";
    }
}