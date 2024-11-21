package com.example.t06.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository repo;

    @GetMapping("/")
    public String index(Model model) {
        List<UserData> users = this.repo.findAll();

        if (!users.isEmpty()) {
            model.addAttribute("results", users);
        }

        return "index";
    }
}