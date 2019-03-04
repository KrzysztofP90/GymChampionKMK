package model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Exercise {

    @Id
    @Column(nullable = false)
    private String name;

    @OneToMany (mappedBy = "exercise")
    private List<Training> trainingList;

    @Column(nullable = false)
    private int maxReps;




    @Column(nullable = false)
    private double maxLoad;

    public Exercise() {
    }

    public Exercise(String name, int maxReps, double maxLoad) {
        this.name = name;
        this.maxReps = maxReps;
        this.maxLoad = maxLoad;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Training> getTrainingList() {
        return trainingList;
    }

    public void setTrainingList(List<Training> trainingList) {
        this.trainingList = trainingList;
    }

    public int getMaxReps() {
        return maxReps;
    }

    public void setMaxReps(int maxReps) {
        this.maxReps = maxReps;
    }

    public double getMaxLoad() {
        return maxLoad;
    }

    public void setMaxLoad(double maxLoad) {
        this.maxLoad = maxLoad;
    }
}
