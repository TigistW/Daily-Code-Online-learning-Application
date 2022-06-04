package com.bootcamp.demo.Repository;

import com.bootcamp.demo.Model.Course;

// import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoursesRepository extends JpaRepository<Course, Long> {

  // @Query(value = "SELECT u FROM User u WHERE u.email= ?1")
  // public User findByEmail(String email);

}
