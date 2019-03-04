package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class PersonalBest {

    @Id
    @GeneratedValue
    private int id;


    @ManyToOne
    private Exercise exercise;

    @Column(nullable = false)
    private int rMax1;

    @Column(nullable = false)
    private int rMax10;


    @ManyToOne
    private User user;


    @ManyToOne
    private AgeCategory ageCategory;


    @ManyToOne
    private WeightCategory weightCategory;

    @Column(nullable = false)
    private Date date;

}
