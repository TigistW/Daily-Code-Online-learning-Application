package com.bootcamp.demo.Model;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
public class Quiz {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Size(min = 2, max = 100, message = "The name must be between 2 and 100 messages.")
  @NotNull(message = "Please provide a name")
  private String name;

  @Size(max = 500, message = "The description can't be longer than 500 characters.")
  @NotNull(message = "Please, provide a description")
  private String description;

  @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP", insertable = false, updatable = false)
  @JsonIgnore
  private Calendar createdDate;

}
