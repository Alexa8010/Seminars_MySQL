-- Промежуточная аттестация
-- SQL

-- users_old
DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

DROP PROCEDURE IF EXISTS move_user;
DELIMITER $$
CREATE PROCEDURE move_user (IN p_id INT)
BEGIN
  DECLARE exit handler for sqlexception
  BEGIN
	ROLLBACK;
  END;
	   
  DECLARE exit handler for sqlwarning
  BEGIN
    ROLLBACK;
  END;
	 
  START TRANSACTION;
  insert into users_old(id, firstname, lastname, email)
    select id, firstname, lastname, email
      from users u
	 where u.id = p_id;
  commit;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS hello;
DELIMITER $$
CREATE FUNCTION hello()
RETURNS VARCHAR(50)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
  DECLARE v_res VARCHAR(50);
  DECLARE v_hour INT;
  SET v_hour = hour(curtime());
  IF v_hour < 6 THEN
    SET v_res = 'Доброй ночи';
  ELSEIF v_hour < 12 THEN
    SET v_res = 'Доброе утро';
  ELSEIF v_hour < 18 THEN
    SET v_res = 'Добрый день';
  ELSE
    SET v_res = 'Добрый вечер';
  END IF;
  RETURN v_res;
END$$

DELIMITER ;



-- CALLS

CALL move_user(2);
SELECT * FROM lesson_4.users_old;

select hello() from dual;