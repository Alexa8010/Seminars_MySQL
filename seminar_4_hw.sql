-- ДЗ СЕМИНАРА 4

use lesson_4_hw;
-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(*) AS n
FROM AUTO
WHERE MARK = 'LADA'
GROUP BY COLOR, MARK 
UNION SELECT MARK, COLOR, COUNT(*) AS n FROM AUTO
WHERE MARK = 'BMW'
GROUP BY COLOR, MARK;



-- Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT a.mark, 
	(SELECT COUNT(*) 
		FROM auto 
        WHERE mark != a.mark) as 'количество AUTO не этой марки' 
FROM (SELECT DISTINCT mark FROM auto) a;

-- Даны 2 таблицы, созданные следующим образом:
CREATE TABLE test_a 
(id_number int, data varchar(1));

CREATE TABLE test_b 
(id_number int);

INSERT INTO test_a(id_number, data) 
VALUES (10, 'A'),
       (20, 'A'),
       (30, 'F'),
       (40, 'D'),
       (50, 'C');

INSERT INTO test_b(id_number) 
VALUES (10),
       (30),
       (50);

--  Напишисать запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT * 
FROM test_a
	LEFT JOIN test_b on test_a.id_number = test_b.id_number
WHERE test_b.id_number IS NULL;   