INSERT INTO gymuser (login, age, bithdaydate, nickname, weight, sex_id)
VALUES ('mihu' ,20 ,'1951-10-12 11:22:29.281000'::timestamp,'the_mihu' ,90 ,1);

--Show me personal best table when user name is "..."
SELECT gu.login, pb.exercise_name, pb.maxweight, pb.date
FROM  gymuser gu
        INNER JOIN personalbest pb ON gu.login = pb.user_login
WHERE gu.login = 'mihu';

INSERT INTO personalbest (id, date, maxweight, agecategory_id, exercise_name, user_login, weightcategory_id)
VALUES (1, '2017-10-12 11:22:29.281000'::timestamp ,120 , 6, 'Squats' ,'mihu',12 );

INSERT INTO personalbest (id, date, maxweight, agecategory_id, exercise_name, user_login, weightcategory_id)
VALUES (2, '2017-10-15 11:22:29.281000'::timestamp ,20 , 6, 'Pull-up' ,'mihu',12 );

INSERT INTO personalbest (id, date, maxweight, agecategory_id, exercise_name, user_login, weightcategory_id)
VALUES (3, '2017-10-21 11:22:29.281000'::timestamp ,100 , 6, 'Bench Press ' ,'mihu',12 );

INSERT INTO personalbest (id, date, maxweight, agecategory_id, exercise_name, user_login, weightcategory_id)
VALUES (4, '2017-10-05 11:22:29.281000'::timestamp ,150 , 6, 'Dead Lift' ,'mihu',12 );

-- Show me training sesions (exercises names) of user '...'
SELECT gu.login, tr.exercise_name, tr.trainingdate
FROM gymuser gu
       INNER JOIN usertraining usTra on gu.login = usTra.userlogin_login
       INNER JOIN training tr on usTra.trainingid_id = tr.id
WHERE gu.login = 'login0';

-- Show me training sesions (exercises names) of user '...'
-- with number of reps, weight and load (r * w)
-- with 1RMax prediction
SELECT gu.login, tr.exercise_name, tr.trainingdate, sets.reps, sets.weight, sets.reps * sets.weight AS load,
       count1rmax(sets.reps, sets.weight) AS RMax_prediction
FROM gymuser gu
       INNER JOIN usertraining usTra on gu.login = usTra.userlogin_login
       INNER JOIN training tr on usTra.trainingid_id = tr.id
       INNER JOIN setscheme sets on tr.set_id = sets.id
WHERE gu.login = 'login0';

-- Create view with ABOVE select
CREATE VIEW all_training_sessions_with_load AS
SELECT gu.login, tr.exercise_name, tr.trainingdate, sets.reps, sets.weight, sets.reps * sets.weight AS load,
       count1rmax(sets.reps, sets.weight) AS RMax_prediction
FROM gymuser gu
       INNER JOIN usertraining usTra on gu.login = usTra.userlogin_login
       INNER JOIN training tr on usTra.trainingid_id = tr.id
       INNER JOIN setscheme sets on tr.set_id = sets.id
WHERE gu.login = 'login0';

-- show me name, exercise name, best weight, best rmax_prediction
-- using all_training view

SELECT allTraining.login, allTraining.exercise_name, MAX(allTraining.weight), MAX(allTraining.RMax_prediction)
FROM all_training_sessions_with_load allTraining
GROUP BY allTraining.exercise_name, allTraining.login;



------------------------------------------------------------------
SELECT gymuser.nickname, training.exercise_name, COUNT(1)
FROM gymuser
       INNER JOIN usertraining ON gymuser.id = usertraining.userlogin_id
       INNER JOIN training ON usertraining.trainingid_id = training.id
WHERE age = 20 GROUP BY training.exercise_name, gymuser.nickname
ORDER BY gymuser.nickname;


CREATE VIEW young_male_viev AS
SELECT gymuser.nickname, gymuser.age FROM gymuser WHERE age > 19 AND age < 30 AND gymuser.sex_sexname = 'male' ORDER BY gymuser.age;

SELECT * FROM young_male_viev;

CREATE FUNCTION count1RMax(repetitions NUMERIC, weight DOUBLE PRECISION)
  RETURNS NUMERIC AS $$
BEGIN
  IF repetitions > 1 THEN
    RETURN weight * (1 + repetitions / 30);
  ELSE
    RETURN weight;
  END IF ;
END;
$$
  LANGUAGE plpgsql;

CREATE VIEW lastThreeWeeksEntries AS
SELECT gu.nickname, t.trainingdate FROM gymuser gu
                                          INNER JOIN usertraining ustr ON gu.id = ustr.userlogin_id
                                          INNER JOIN training t on ustr.trainingid_id = t.id
WHERE t.trainingdate > (current_timestamp - interval '500 hours')
ORDER BY t.trainingdate;

SELECT * FROM lastThreeWeeksEntries;

