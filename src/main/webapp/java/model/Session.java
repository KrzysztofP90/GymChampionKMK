package model;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Session {

    @Column(nullable = false)
    private User userLogin;

    @Column(nullable = false)
    private String sessionId;

    public Session() {
    }

    public Session(User userLogin, String sessionId) {
        this.userLogin = userLogin;
        this.sessionId = sessionId;
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
