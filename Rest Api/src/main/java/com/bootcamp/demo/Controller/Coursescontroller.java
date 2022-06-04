package com.bootcamp.demo.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.List;

// import javax.sound.sampled.Line;
import javax.validation.Valid;

import com.bootcamp.demo.Model.Course;
import com.bootcamp.demo.Repository.CoursesRepository;
import com.bootcamp.demo.Repository.UserCoursesRepository;

// import org.hibernate.query.criteria.internal.expression.function.AggregationFunction.LEAST;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin(origins = "*")
// @RequestMapping("/api")
public class Coursescontroller {

  public static String uploadDirectory = System.getProperty("user.dir") + "/uploads";

  @Autowired
  private CoursesRepository courseRepo;

  @Autowired
  private UserCoursesRepository ucRepo;

  @GetMapping(value = "/allCourses")
  public List<Course> getCourses() {
    return courseRepo.findAll();
  }

  @GetMapping(value = "/Course/{id}")
  public Course getcourses(@PathVariable long id) {
    return courseRepo.findById(id).get();
  }

  @PostMapping(value = "/addCourse")
  public Course addCourse(@RequestBody Course courses) {
    return courseRepo.save(courses);
  }

  @PutMapping(value = "/updatecourse/{id}")
  public String updateCourse(@RequestBody Course courses, @PathVariable long id) {
    Course updatedCourse = courseRepo.findById(id).get();
    updatedCourse.setTitle(courses.getTitle());
    updatedCourse.setDescription(courses.getDescription());
    updatedCourse.setCode(courses.getCode());
    courseRepo.save(updatedCourse);
    return "updated";
  }

  @DeleteMapping(value = "/deleteCourse/{id}")
  public String deleteCourse(@PathVariable long id) {
    Course deleteCourse = courseRepo.findById(id).get();
    courseRepo.delete(deleteCourse);
    return "deleted";
  }

 
}
