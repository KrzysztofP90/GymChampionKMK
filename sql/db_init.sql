-- change owner to yourself
-- open postgres in terminal: "psql"
-- load this file: "\i db_init.sql"


CREATE DATABASE "GymChampion" WITH OWNER = mihuadmin ENCODING = 'UTF8';

CREATE TABLE set_scheme(
                         set_id serial PRIMARY KEY,
                         repetitions integer,
                         load double precision
);

CREATE TABLE exercise (
                        exercise_id serial PRIMARY KEY,
                        name varchar(20) unique,
                        max_repetitions integer,
                        max_load integer
);

CREATE TABLE login_data(
                         login_id serial PRIMARY KEY,
                         user_login varchar(20) unique REFERENCES gym_user(user_login),
                         password varchar(20)
);

CREATE TABLE age_category(
  age_category_id serial PRIMARY KEY,
  min_age smallint NOT NULL,
  max_age smallint NOT NULL,
  category_name varchar(20) not null
);

-- need gender, age_category and weight_category
CREATE TABLE gym_user (
  user_login VARCHAR(15),
  nickname VARCHAR(20),
  age SMALLINT NOT NULL,
  gender INT REFERENCES gender(gender_id),
  weight SMALLINT NOT NULL,
  age_category INT REFERENCES age_category(age_cateory_id),
  weight_category INT REFERENCES weight_category(weight_category_id),
  PRIMARY KEY(user_login)
);

-- need gym_user and training
CREATE TABLE user_training (
  user_login VARCHAR(15) REFERENCES gym_user(user_login),
  training_id INT REFERENCES training(training_id)
);

-- need gym_user
CREATE TABLE session (
  user_login VARCHAR(15) REFERENCES gym_user(user_login),
  session_id VARCHAR(100),
  login_data TIMESTAMP
);

-- need exercise and set_scheme
CREATE TABLE training (
  training_id INT,
  exercise_id INT REFERENCES exercise(exercise_id),
  set_id INT REFERENCES set_scheme(set_id),
  training_date TIMESTAMP,
  PRIMARY KEY(trainig_id)
);