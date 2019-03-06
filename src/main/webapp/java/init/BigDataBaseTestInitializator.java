package init;

import model.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
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
            Date randomBirthdayDate = generateRandomBirthdayDay();
            int weight = getRandomWeight();
            User fakeUser = new User(login,nickname, randomBirthdayDate, getRandomGender(), weight);
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
        long now = System.currentTimeMillis();
        long constructor = now - backTime;
        return new java.util.Date(constructor);
    }

    private Exercise getRandomExercise() {
        int rand = random.nextInt(5);
        return exerciseList.get(rand);
    }


    private Date generateRandomBirthdayDay() {

        int randomYearFrom1930To2003 = random.nextInt(73) + 1930;
        int randomMonth = random.nextInt(12);
        int randomDay = random.nextInt(30) + 1;

        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(randomYearFrom1930To2003,randomMonth,randomDay);
        return new Date(calendar.getTimeInMillis());
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
