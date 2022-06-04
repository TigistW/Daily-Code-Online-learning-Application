package com.bootcamp.demo.Controller;

import javax.validation.Valid;
import javax.validation.constraints.Null;

import com.bootcamp.demo.Model.Course;
import com.bootcamp.demo.Model.User;
import com.bootcamp.demo.Repository.CoursesRepository;
import com.bootcamp.demo.Repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class UsersController {

  @Autowired
  private UserRepository repo;

  @Autowired
  private CoursesRepository courseRepo;

  @GetMapping("")
  public String viewHomePage() {
    return "home";
  }

  @GetMapping(value = "/allUsers")
  public List<User> getUser() {
    return repo.findAll();
  }

  @GetMapping(value = "/User/{id}")
  public User getUser(@PathVariable long id) {
    return repo.findById(id).get();
  }

  @PostMapping(value = "/auth")
  public User Login(@RequestBody User user) {
    User oldUser = repo.findByEmail(user.getEmail());
    return oldUser;
  }

  @PostMapping(value = "/addUser")
  public User addUser(@RequestBody User user) {
    boolean eUser = repo.findAll().isEmpty();
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    String encodedPassword = encoder.encode(user.getPassword());
    user.setPassword(encodedPassword);

    if (eUser) {
      user.setRole("Admin");
    } else {
      user.setRole("user");
    }
    return repo.save(user);
  }

  @PostMapping(value = "/addNewUser")
  public User addNewUser(@RequestBody User user) {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    String encodedPassword = encoder.encode(user.getPassword());
    user.setPassword(encodedPassword);

    return repo.save(user);
  }

  
  @DeleteMapping(value = "/deleteUser/{id}")
  public String deleteUser(@PathVariable long id) {
    User deleteUser = repo.findById(id).get();
    repo.delete(deleteUser);
    return "deleted";
  }

  

}
