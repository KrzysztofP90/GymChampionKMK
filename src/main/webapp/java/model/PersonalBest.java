package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.Date;

@Entity
public class PersonalBest {

    @Column(nullable = false)
    private Exercise exercise;

    @Column(nullable = false)
    private int rMax1;

    @Column(nullable = false)
    private int rMax10;

    @Column(nullable = false)
    private User user;

    @Column(nullable = false)
    private AgeCategory ageCategory;

    @Column(nullable = false)
    private WeightCategory weightCategory;

    @Column(nullable = false)
    private Date date;

}
