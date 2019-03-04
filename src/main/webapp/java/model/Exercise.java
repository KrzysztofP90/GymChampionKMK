package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Exercise {

    @Id
    @Column(nullable = false)
    private String name;

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
