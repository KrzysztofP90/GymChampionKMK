package model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LoginData {

    @Id
    @GeneratedValue
    private int id;

    @Column(nullable = false, unique = false)
    private User login;

    @Column(nullable = false)
    private String password;

    public LoginData() {
    }

    public LoginData(User login, String password) {
        this.login = login;
        this.password = password;
    }

    public User getLogin() {
        return login;
    }

    public void setLogin(User login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
