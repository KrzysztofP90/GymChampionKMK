SELECT gymuser.nickname, training.exercise_name, COUNT(1)
FROM gymuser
INNER JOIN usertraining ON gymuser.id = usertraining.userlogin_id
INNER JOIN training ON usertraining.trainingid_id = training.id
WHERE age = 20 GROUP BY training.exercise_name, gymuser.nickname
ORDER BY gymuser.nickname;

INSERT INTO gymuser (id, age, login, nickname, weight, sex_sexname) VALUES (101, 20, 'mihu', 'the_mihu', 90, 'male');

CREATE VIEW young_male_viev AS
  SELECT gymuser.nickname, gymuser.age FROM gymuser WHERE age > 19 AND age < 30 AND gymuser.sex_sexname = 'male' ORDER BY gymuser.age;

SELECT * FROM young_male_viev;



