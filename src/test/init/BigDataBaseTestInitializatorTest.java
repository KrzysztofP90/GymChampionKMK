package init;

import org.junit.jupiter.api.Test;

import java.sql.Date;

import static org.junit.jupiter.api.Assertions.*;

class BigDataBaseTestInitializatorTest {

    @Test
    public void generateRandomDate() {
        BigDataBaseTestInitializator initializator = new BigDataBaseTestInitializator();
        long now = System.currentTimeMillis();

        for (int i =0; i < 1000;i++ ){
            System.out.println(i);
            Date expected = new Date(now);
            java.util.Date actual = initializator.generateRandomDate();
            assertTrue(actual.before(expected));
        }

    }



}