package com.bootcamp.demo.Repository;

import java.util.Optional;

import com.bootcamp.demo.Model.Quiz;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {

  // @Query(value = "SELECT q FROM Quiz q WHERE q.id=: id")
  // public Quiz findOne(@Param("id") Long id);

  // public Quiz save(Optional<Quiz> currentQuiz);

  // public void delete(Optional<Quiz> quiz);

  // // @Query("SELECT e FROM TheEntity e WHERE e.stuff = :stuff")
  // // List<SomeEntity> findSomething(@Param("stuff") String someStr);

}
