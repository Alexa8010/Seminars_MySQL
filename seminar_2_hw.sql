/*СЕМИНАР 2. ДЗ*/

/*1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
*/
USE lesson2;

-- 2. Создание таблицы 
CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE,
  count_product INT UNSIGNED
  );
  
  DESC sales;
  
  INSERT INTO sales (order_date, count_product)
VALUES 
  ('2022-01-01', '156'),
  ('2022-01-02', '180'),
  ('2022-01-03', '21'),
  ('2022-01-04', '124'),
  ('2022-01-05', '341');
  
  SELECT * FROM sales;
  
  /*2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ*/

-- CASE
SELECT id AS 'id заказа',
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Средний заказ"
END AS 'Тип заказа'
FROM sales;

/* 3. Создайте таблицу “orders”, заполните ее значениями. 
Выберите все заказы. 
В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»*/

CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(45) NOT NULL UNIQUE,
  amount DECIMAL(5,2) UNSIGNED NOT NULL,
  order_status VARCHAR(45) NOT NULL
  );
  
  DESC orders;
  
  INSERT INTO orders (employee_id, amount, order_status)
VALUES 
  ('e03', '15.00', 'OPEN'),
  ('e01', '25.50', 'OPEN'),
  ('e05', '100.70', 'CLOSED'),
  ('e02', '22.18', 'OPEN'),
  ('e04', '9.50', 'CANCELLED');
  
  SELECT * FROM orders;
  
  SELECT id, employee_id, amount,
CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
    ELSE "Error 404"
END AS 'full_order_status'
FROM orders;

/* Чем NULL отличается от 0?

NULL - это отсутствие данных. 
0 - это конкретные данные. При числовом типе, 0 - число, с которым можно совершать арифметические 
действия (за исключением деления на 0), 0 может отражать нулевую длину строки, 0 отражает 
FALSE при булевом типе. 
*/
  