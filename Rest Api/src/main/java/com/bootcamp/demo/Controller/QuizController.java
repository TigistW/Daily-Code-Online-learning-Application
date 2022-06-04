package com.bootcamp.demo.Controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import com.bootcamp.demo.Model.Quiz;
// import com.bootcamp.demo.Repository.QuestionRepository;
import com.bootcamp.demo.Repository.QuizRepository;
// import com.bootcamp.demo.Service.QuizService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class QuizController {


  @Autowired
  private QuizRepository quizRepo;

  @GetMapping(value = "/allQuiz")
  public List<Quiz> getQuizes() {
    return quizRepo.findAll();
  }

  @PostMapping(value = "/addQuiz")
  // @ResponseStatus(HttpStatus.CREATED)
  public Quiz addQuiz(@RequestBody Quiz quiz) {
    return quizRepo.save(quiz);
  }

  @GetMapping(value = "/getQuizByIdQuiz/{quiz_id}")
  public Quiz findQuiz(@PathVariable Long quiz_id) {
    return quizRepo.findById(quiz_id).get();
  }

  @DeleteMapping(value = "/deleteQuiz/{quiz_id}")
  public String delete(@PathVariable Long quiz_id) {
    Quiz deleteQuiz = quizRepo.findById(quiz_id).get();
    quizRepo.delete(deleteQuiz);
    return "deleted";
  }

  @PutMapping(value = "/updateQuiz/{id}")
  public String updateQuiz(@RequestBody Quiz quiz, @PathVariable long id) {
    Quiz updatedQuiz = quizRepo.findById(id).get();
    updatedQuiz.setDescription(quiz.getDescription());
    updatedQuiz.setName(quiz.getName());
    quizRepo.save(updatedQuiz);
    return "Course Updated";
  }

  

}
