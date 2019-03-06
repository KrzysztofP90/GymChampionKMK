-- change owner to yourself
-- open postgres in terminal: "psql"
-- load this file: "\i db_init.sql"


-- CREATE DATABASE "GymChampion" WITH OWNER = Krzysztof ENCODING = 'UTF8';

-- \c GymChampion

create table gender (
  gender_id INTEGER,
  sex VARCHAR(15) not null ,
  PRIMARY KEY(gender_id)
);

create table weight_category (
  weight_category_id integer,
  min_weight SMALLINT not null ,
  max_weight SMALLINT not null ,
  category_name VARCHAR(20) not null ,
  PRIMARY KEY(weight_category_id)
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
  birthday_date timestamp,
  age SMALLINT NOT NULL,
  gender INT REFERENCES gender(gender_id),
  weight SMALLINT NOT NULL,
  age_category INT REFERENCES age_category(age_category_id),
  weight_category INT REFERENCES weight_category(weight_category_id),
  PRIMARY KEY(user_login)
);

CREATE TABLE login_data(
   login_id serial PRIMARY KEY,
   user_login varchar(20) unique REFERENCES gym_user(user_login),
   password varchar(20)
);


CREATE TABLE exercise (
  exercise_id serial PRIMARY KEY,
  name varchar(20) unique,
  max_repetitions integer,
  max_load integer
);

CREATE TABLE set_scheme(
   set_id serial PRIMARY KEY,
   repetitions integer,
   load double precision
);


create table personal_best (
  exercise_id INTEGER,
  rmax1 INTEGER,
  rmax10 INTEGER,
  user_login varchar(15),
  age_category_id INTEGER,
  weight_category_id INTEGER,
  date timestamp,
  FOREIGN KEY(exercise_id) REFERENCES exercise(exercise_id),
  FOREIGN KEY(user_login) references gym_user(user_login),
  FOREIGN KEY(age_category_id) references age_category(age_category_id),
  FOREIGN KEY(weight_category_id) references weight_category(weight_category_id)
);


-- need exercise and set_scheme
CREATE TABLE training (
  training_id INT,
  exercise_id INT REFERENCES exercise(exercise_id),
  set_id INT REFERENCES set_scheme(set_id),
  training_date TIMESTAMP,
  PRIMARY KEY(training_id)
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




