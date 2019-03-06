package model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "GymUser")

public class User {

    @Id
    @GeneratedValue
    private int id;


    private String login;

    @OneToMany @ManyToOne(targetEntity = AgeCategory.class)
    private AgeCategory ageCategory;

    @OneToMany @ManyToOne(targetEntity = WeightCategory.class)
    private WeightCategory weightCategory;


    private String nickname;

    @Column(nullable = false)
    private int age;

    @ManyToOne
    private Gender sex;

    @Column(nullable = false)
    private int weight;



    public User() {
    }


    public User(String login, String nickname, int age, Gender sex, int weight) {
        this.login = login;
        this.nickname = nickname;
        this.age = age;
        this.sex = sex;
        this.weight = weight;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public AgeCategory getAgeCategory() {
        return ageCategory;
    }

    public void setAgeCategory(AgeCategory ageCategory) {
        this.ageCategory = ageCategory;
    }

    public WeightCategory getWeightCategory() {
        return weightCategory;
    }

    public void setWeightCategory(WeightCategory weightCategory) {
        this.weightCategory = weightCategory;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Gender getSex() {
        return sex;
    }

    public void setSex(Gender sex) {
        this.sex = sex;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
}
