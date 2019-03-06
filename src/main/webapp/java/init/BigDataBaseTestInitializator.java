package init;

import model.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.sql.Date;
import java.util.*;

public class BigDataBaseTestInitializator {

    private List<AgeCategory> ageCategoryList;
    private List<WeightCategory> weightCategoryList;
    private List<Exercise> exerciseList;
    private Gender male;
    private Gender female;
    private List<User> userList;
    private Random random;
    private List<LoginData> loginDataList;
    private List<SetScheme> schemes;

    private List<Training> trainingListRecords;
    private List<UserTraining> listOfUsersTrainings;


    public BigDataBaseTestInitializator() {
        this.male = new Gender("male");
        this.female  = new Gender("female");
        this.random = new Random();
        this.loginDataList = new ArrayList<>();
        this.schemes = new ArrayList<>();
        this.trainingListRecords = new ArrayList<>();
        this.listOfUsersTrainings = new ArrayList<>();
        this.userList = new ArrayList<>();
    }

    private void generateWeightCategory() {

        weightCategoryList = new ArrayList<>();
        weightCategoryList.add(new WeightCategory(50, 60, "light"));
        weightCategoryList.add(new WeightCategory(61, 70, "medium"));
        weightCategoryList.add(new WeightCategory(71, 85, "heavy"));
        weightCategoryList.add(new WeightCategory(86, 100, "superheavy"));
        weightCategoryList.add(new WeightCategory(101, 200, "megaheavy"));


    }

    private void generateAgeCategory() {

        ageCategoryList = new ArrayList<>();
        ageCategoryList.add(new AgeCategory(16, 20, "Teens"));
        ageCategoryList.add(new AgeCategory(21, 30, "Young"));
        ageCategoryList.add(new AgeCategory(31, 40, "Young+")) ;
        ageCategoryList.add(new AgeCategory(41, 50, "Adult"));
        ageCategoryList.add(new AgeCategory(51, 60, "Mature"));
        ageCategoryList.add(new AgeCategory(61, 70, "Old"));
        ageCategoryList.add(new AgeCategory(71, 150, "Senior"));

    }

    private void generateExercise() {

        exerciseList = new ArrayList<>();
        exerciseList.add(new Exercise("Dead Lift", 1000, 500));
        exerciseList.add(new Exercise("Deeps",200, 200 ));
        exerciseList.add(new Exercise("Squats",1000, 300 ));
        exerciseList.add(new Exercise("Pull-up",100, 100 ));
        exerciseList.add(new Exercise("Bench Press ",100, 500 ));

    }

//    private WeightCategory getWeigthCategory(int weigth) {
//         if (weigth <= 80 && weigth >= 70) {
//             return weightCategoryList.get(0);
//         }
//         else if (weigth <= 90 && weigth >= 81) {
//             return weightCategoryList.get(1);
//         }
//         else if (weigth <= 100 && weigth >= 91) {
//             return weightCategoryList.get(2);
//         }
//         else if (weigth <= 110 && weigth >= 101) {
//             return weightCategoryList.get(3);
//         }
//         else  {
//             return weightCategoryList.get(4);
//         }
//    }

//    private AgeCategory getAgeCategory(int age) {
//
//        if (age <= 25 && age >= 18) {
//            return ageCategoryList.get(0);
//        }
//        else if (age <= 30 && age >= 26) {
//            return ageCategoryList.get(1);
//        }
//        else if (age <= 35 && age >= 31) {
//            return ageCategoryList.get(2);
//        }
//        else if (age <= 45 && age >= 36) {
//            return ageCategoryList.get(3);
//        }
//        else if (age <= 50 && age >= 46) {
//            return ageCategoryList.get(4);
//        }
//        else if (age <= 55 && age >= 51) {
//            return ageCategoryList.get(5);
//        }
//        else  {
//            return ageCategoryList.get(6);
//        }
//    }

    private int getRandomAge() {

        return random.nextInt(100) + 18;
    }

    private int getRandomWeight() {

        return random.nextInt(100) + 60;
    }

    private Gender getRandomGender() {

        int rand = random.nextInt(2);
        if (rand == 1) {
            return female;
        }
        else return male;
    }

    private void createUsersList(int actualUsersCount) {


        for (int i = actualUsersCount; i < actualUsersCount + 1000; i++) {
            String login = "login" + String.valueOf(i);
            String nickname = "nickname" + String.valueOf(i);
            int age = getRandomAge();
            int weight = getRandomWeight();
            User fakeUser = new User(login,nickname, age, getRandomGender(), weight);
            String password = "password" + String.valueOf(i);
            loginDataList.add(new LoginData(fakeUser, password));
            userList.add(fakeUser);
            generate10to500TrainigsAndUsersTrainings(fakeUser);
        }
    }

    private void generate1000TestSchemas() {
        for (int i = 0; i < 1000; i++) {
            schemes.add(new SetScheme(generateRandomReps(), generateRandomLoad()));
        }
    }

    private SetScheme getRandomScheme() {
        int rand = random.nextInt(1000);
        return schemes.get(rand);
    }

    private int generateRandomReps() {
        return random.nextInt(15)+1;
    }

    private int generateRandomLoad() {
        return random.nextInt(400) + 10;
    }

    public java.util.Date generateRandomDate() {
        long backTime = (long) random.nextInt(93536000) * (long)1000;
//        java.util.Date dateObj = new java.util.Date();
//        long dateMilisec = dateObj.getTime();

//        GregorianCalendar calendar = new GregorianCalendar();
//        calendar.set(2018,2,22);
        long now = System.currentTimeMillis();
        long constructor = now - backTime;
//        long constructor = calendar.getTimeInMillis();
//        System.out.println(new Date(constructor));
        return new java.util.Date(constructor);
    }

    private Exercise getRandomExercise() {
        int rand = random.nextInt(5);
        return exerciseList.get(rand);
    }

    private void generate10to500TrainigsAndUsersTrainings(User user) {
        int count = random.nextInt(490) + 10;
        for (int i = 0; i < count; i++) {
            Training training = new Training(getRandomExercise(), getRandomScheme(),generateRandomDate() );
            listOfUsersTrainings.add(new UserTraining(user, training));
            trainingListRecords.add(training);
        }
    }

    private void prepareSmallData() {

        generate1000TestSchemas();

        generateAgeCategory();
        generateWeightCategory();
        generateExercise();
    }

    private void prepareBigData(int actualUsersCount) {

        createUsersList(actualUsersCount);
    }

    private void cleanBigData() {

        this.userList.clear();
        this.userList = new ArrayList<>();
        this.loginDataList.clear();
        this.loginDataList = new ArrayList<>();
        this.listOfUsersTrainings.clear();
        this.listOfUsersTrainings = new ArrayList<>();
        this.trainingListRecords.clear();
        this.trainingListRecords = new ArrayList<>();

    }


    public void fillDataBase(EntityManager manager, int countOfTousandFakeUsers) {



        prepareSmallData();

        EntityTransaction transaction =  manager.getTransaction();


        transaction.begin();

        manager.persist(male);
        manager.persist(female);

        for (AgeCategory a : ageCategoryList) {
            manager.persist(a);
        }
        for (WeightCategory w : weightCategoryList) {
            manager.persist(w);
        }

        for (SetScheme s : schemes) {
            manager.persist(s);
        }

        for (Exercise e : exerciseList) {
            manager.persist(e);
        }

        transaction.commit();



        int actualUsersCount = 0;

        EntityTransaction transactionBigData =  manager.getTransaction();
        transactionBigData.begin();



        for (int i = 0; i < countOfTousandFakeUsers; i++) {

            prepareBigData(actualUsersCount);

            for (User u : userList) {
                manager.persist(u);
            }

            for (LoginData lg : loginDataList) {
                manager.persist(lg);
            }

            for (Training t : trainingListRecords) {
                manager.persist(t);
            }

            for (UserTraining ut : listOfUsersTrainings) {
                manager.persist(ut);
            }

            cleanBigData();
            actualUsersCount += 1000;
        }

        transactionBigData.commit();

    }
}
