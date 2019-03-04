package init;

import model.*;
import org.hibernate.Transaction;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

public class DataBaseInitializator {

    private void testInitDB(EntityManager menager) {

        Gender male = new Gender("male");
        Gender female = new Gender("female");

        AgeCategory ageCategory1 = new AgeCategory(18, 25, "Young");

        WeightCategory weightCategory1 = new WeightCategory(60, 70, "light");

        User firstUser = new User("Pawel", "Pawcio" ,23, male, 68, ageCategory1, weightCategory1);

        LoginData firstUserLogin = new LoginData(firstUser, "abc");

        Exercise deadLift = new Exercise("deadLift", 50, 500);

        SetScheme scheme1 = new SetScheme(12,60.00);
        SetScheme scheme2 = new SetScheme(10,70.00);
        SetScheme scheme3 = new SetScheme(8,80.00);

        Training training1 = new Training(deadLift,scheme1,new Date(2019,3,3));
        Training training2 = new Training(deadLift,scheme2, new Date(2019,3,3));



        UserTraining firstTraining = new UserTraining(firstUser, training1);



        EntityTransaction transaction = menager.getTransaction();
        transaction.begin();

        menager.persist(male);
        menager.persist(female);

        menager.persist(ageCategory1);
        menager.persist(weightCategory1);

        menager.persist(firstUser);

        menager.persist(firstUserLogin);

        menager.persist(deadLift);

        menager.persist(scheme1);
        menager.persist(scheme2);
        menager.persist(scheme3);

        menager.persist(training1);
        menager.persist(training2);

        menager.persist(firstTraining);

        transaction.commit();
        menager.close();
    }

    public static void main(String[] args) {


        EntityManagerFactory factory = Persistence.createEntityManagerFactory("TestGymChampion");
        EntityManager menager = factory.createEntityManager();

        DataBaseInitializator initializator = new DataBaseInitializator();
        initializator.testInitDB(menager);

        factory.close();


    }
}
