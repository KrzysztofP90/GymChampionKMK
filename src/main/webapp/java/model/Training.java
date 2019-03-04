package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Training", indexes = {
        @Index(columnList = "trainingDate")
})
public class Training {


    @Id
    @GeneratedValue
    @Column(nullable = false)
    private int id;

    @Column(nullable = false)
    private Exercise exercise;

    @Column(nullable = false)
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
