package model;

import javax.persistence.*;
import java.util.List;

@Entity
public class AgeCategory {


    @Id
    @GeneratedValue
    private int id;

    @OneToMany(mappedBy = "ageCategory")
    private List<User> userList;

    @Column(nullable = false)
    private int minAge;

    @Column(nullable = false)
    private int maxAge;

    @Column(nullable = false)
    private String categoryName;

    public AgeCategory() {
    }


    public AgeCategory(int minAge, int maxAge, String categoryName) {
        this.minAge = minAge;
        this.maxAge = maxAge;
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public int getMinAge() {
        return minAge;
    }

    public void setMinAge(int minAge) {
        this.minAge = minAge;
    }

    public int getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(int maxAge) {
        this.maxAge = maxAge;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
