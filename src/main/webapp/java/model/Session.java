package model;

import javax.persistence.*;

@Entity
public class Session {

    @Id
    @GeneratedValue
    private int id;


    @OneToOne
    private User userLogin;

    @Column(nullable = false)
    private String sessionId;

    public Session() {
    }

    public Session(User userLogin, String sessionId) {
        this.userLogin = userLogin;
        this.sessionId = sessionId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(User userLogin) {
        this.userLogin = userLogin;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
}
