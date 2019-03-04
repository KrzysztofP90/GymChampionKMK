package model;

import javax.persistence.*;
import java.sql.Date;


@Entity
public class Training {


    @Id
    @GeneratedValue
    private int id;


    @ManyToOne
    private Exercise exercise;


    @ManyToOne
    private SetScheme set;

    @Column(nullable = false)
    private Date trainingDate;

    public Training() {
    }

    public Training(Exercise exercise, SetScheme set, Date trainingDate) {
        this.exercise = exercise;
        this.set = set;
        this.trainingDate = trainingDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Exercise getExercise() {
        return exercise;
    }

    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

    public SetScheme getSet() {
        return set;
    }

    public void setSet(SetScheme set) {
        this.set = set;
    }

    public Date getTrainingDate() {
        return trainingDate;
    }

    public void setTrainingDate(Date trainingDate) {
        this.trainingDate = trainingDate;
    }
}
