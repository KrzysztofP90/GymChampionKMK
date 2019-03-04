package model;

import javax.persistence.*;
import java.util.List;


@Entity
public class WeightCategory {

    @Id
    @GeneratedValue
    private int id;

    @OneToMany(mappedBy = "weightCategory")
    List<User> userList;

    @Column(nullable = false)
    private int minWeight;

    @Column(nullable = false)
    private int maxWeight;

    @Column(nullable = false)
    private String categoryName;

    public WeightCategory() {
    }

    public WeightCategory(int minWeight, int maxWeight, String categoryName) {
        this.minWeight = minWeight;
        this.maxWeight = maxWeight;
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

    public int getMinWeight() {
        return minWeight;
    }

    public void setMinWeight(int minWeight) {
        this.minWeight = minWeight;
    }

    public int getMaxWeight() {
        return maxWeight;
    }

    public void setMaxWeight(int maxWeight) {
        this.maxWeight = maxWeight;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
