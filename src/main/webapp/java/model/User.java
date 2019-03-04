package model;

import javax.persistence.*;

@Entity
@Table(name = "User", indexes = {
        @Index(columnList = "nickname")
})
public class User {

    @Id
    @Column(nullable = false)
    private String login;


    private String nickname;

    @Column(nullable = false)
    private int age;

    @Column(nullable = false)
    private Gender sex;

    @Column(nullable = false)
    private int weight;

    @Column(nullable = false)
    private AgeCategory ageCategory;

    @Column(nullable = false)
    private WeightCategory weightCategory;


    public User() {
    }

    public User(String login, String nickname, int age, Gender sex, int weight, AgeCategory ageCategory, WeightCategory weightCategory) {
        this.login = login;
        this.nickname = nickname;
        this.age = age;
        this.sex = sex;
        this.weight = weight;
        this.ageCategory = ageCategory;
        this.weightCategory = weightCategory;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
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
}
