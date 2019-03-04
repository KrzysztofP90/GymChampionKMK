package model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class UserTraining {

    @Column(nullable = false)
    private User userLogin;

    @Column(nullable = false)
    private Training trainingId;


    public UserTraining() {
    }

    public UserTraining(User userLogin, Training trainingId) {
        this.userLogin = userLogin;
        this.trainingId = trainingId;
    }

    public User getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(User userLogin) {
        this.userLogin = userLogin;
    }

    public Training getTrainingId() {
        return trainingId;
    }

    public void setTrainingId(Training trainingId) {
        this.trainingId = trainingId;
    }
}
