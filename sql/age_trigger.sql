create or replace function age_correction_trigger() returns trigger
  language plpgsql as
  $agetrig$
  declare
answer boolean;
BEGIN

  answer=  setUserAge(NEW.login);

  return NEW;
END; $agetrig$;



create TRIGGER age_correction
  after insert on public.gymuser
  for each row
  EXECUTE PROCEDURE age_correction_trigger();



create or replace function setUserAge(user_login varchar(100)) returns boolean
 language plpgsql as $$
  DECLARE
    user_age_interval interval;
    age_in_years integer;
    yearQuery varchar(100);
    birthday timestamp;
    birthday_query varchar(100);
    update_query varchar(100);

  BEGIN
    birthday_query =  Format('select gymuser.birthdaydate from gymuser where gymuser.login = ''%s'';',user_login) ;
    EXECUTE  birthday_query into birthday;
    user_age_interval = age(birthday);
    yearQuery = FORMAT('SELECT EXTRACT (YEAR FROM INTERVAL ''%s'');', user_age_interval);
  EXECUTE yearQuery into age_in_years;


    RAISE NOTICE 'Extract year is s%', age_in_years;

    update_query = FORMAT('UPDATE gymuser set age  = ''%s'' where login = ''%s'' ;', age_in_years, user_login);
    EXECUTE update_query;
    return true;
  END; $$;