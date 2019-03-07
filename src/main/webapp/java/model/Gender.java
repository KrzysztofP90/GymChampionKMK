package model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Gender {

    @Id
    @GeneratedValue
    private int id;

    @Column
    private String sexName;

    public Gender() {
    }

    public Gender(String sexName) {
        this.sexName = sexName;
    }

    public String getSexName() {
        return sexName;
    }

    public void setSexName(String sexName) {
        this.sexName = sexName;
    }

    public int getId() {
        return id;
    }

}
