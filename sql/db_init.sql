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
