CREATE or replace FUNCTION count1rmax(repetitions integer, weight DOUBLE PRECISION)
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


CREATE or replace VIEW all_training_sessions_with_load AS
  SELECT gu.login, tr.exercise_name,
         tr.trainingdate , sets.reps,
         sets.weight, sets.reps * sets.weight AS load,
         count1rmax(sets.reps, sets.weight) AS RMax_prediction
  FROM gymuser gu
         INNER JOIN usertraining usTra on gu.login = usTra.userlogin_login
         INNER JOIN training tr on usTra.trainingid_id = tr.id
         INNER JOIN setscheme sets on tr.set_id = sets.id
  WHERE gu.login = 'login0' order by tr.trainingdate;






-- CREATE INDEX index_date_of_training on "GymChampion".public.training(trainingdate);