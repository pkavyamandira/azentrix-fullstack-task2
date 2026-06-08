package com.azentrix.taskflowpro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.azentrix.taskflowpro.entity.User;
import com.azentrix.taskflowpro.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {

        User user =
                (User) session.getAttribute("loggedUser");

        if(user == null) {
            return "redirect:/login";
        }

        if("ADMIN".equals(user.getRole())) {
            return "dashboard";
        }

        return "dashboard";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute User user, Model model) {

        if(userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("msg", "Email already exists");
            return "register";
        }

        user.setRole("MEMBER");
        userService.saveUser(user);

        model.addAttribute("msg", "Registration Successful");
        return "login";
    }

    @PostMapping("/loginUser")
    public String loginUser(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        User user = userService.findByEmail(email);

        if(user != null &&
           user.getPassword().equals(password)) {

            session.setAttribute("loggedUser", user);

            return "redirect:/dashboard";
        }

        model.addAttribute("msg", "Invalid Email or Password");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate();

        return "redirect:/";
    }
}