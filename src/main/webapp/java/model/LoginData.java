package model;


import javax.persistence.*;

@Entity
public class LoginData {

    @Id
    @GeneratedValue
    private int id;

    @OneToOne(targetEntity = User.class)
    private User login;

    @Column(nullable = false)
    private String password;

    public LoginData() {
    }

    public LoginData(User login, String password) {
        this.login = login;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
