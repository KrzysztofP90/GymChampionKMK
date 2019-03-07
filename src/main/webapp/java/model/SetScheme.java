package model;


import javax.persistence.*;
import java.util.List;

@Entity
public class SetScheme {

    @Id
    @GeneratedValue
    private int id;

    @OneToMany(mappedBy = "set")
    private List<Training> trainingList;

    @Column(nullable = false)
    private int reps;

    @Column(nullable = false)
    private double weight;

    public SetScheme() {
    }

    public SetScheme(int reps, double load) {
        this.reps = reps;
        this.weight = load;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Training> getTrainingList() {
        return trainingList;
    }

    public void setTrainingList(List<Training> trainingList) {
        this.trainingList = trainingList;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public double getLoad() {
        return weight;
    }

    public void setLoad(double load) {
        this.weight = load;
    }
}
