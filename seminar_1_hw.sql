/*1. Создайте таблицу с мобильными телефонами, используя графический
интерфейс. Заполните БД данными.*/

CREATE TABLE `seminar_1_hw`.`phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` VARCHAR(45) NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

INSERT INTO `seminar_1_hw`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone X', 'Apple', '3', '76000');
INSERT INTO `seminar_1_hw`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 8', 'Apple', '2', '51000');
INSERT INTO `seminar_1_hw`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `seminar_1_hw`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `seminar_1_hw`.`phones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('P 20 Pro', 'Huawei', '5', '36000');

/*2. Выведите название, производителя и цену для товаров,
количество которых превышает 2 (SQL - файл, скриншот, либо сам
код)*/
USE seminar_1_hw;
SELECT ProductName, Manufacturer, Price FROM phones WHERE ProductCount > '2';

/*3. Выведите весь ассортимент товаров марки “Samsung”*/
USE seminar_1_hw;
SELECT * FROM phones WHERE Manufacturer = 'Samsung';

/*4.*** С помощью регулярных выражений найти:
/*4.1. Товары, в которых есть упоминание "Iphone"*/
USE seminar_1_hw;
SELECT * FROM phones WHERE ProductName LIKE 'iPhone%';

/*4.2. "Samsung"*/
USE seminar_1_hw;
SELECT * FROM phones WHERE Manufacturer LIKE '%samsung%';

/*4.3. Товары, в которых есть ЦИФРЫ*/
USE seminar_1_hw;
SELECT * FROM phones WHERE ProductName RLIKE '[0-9]';

/*4.4. Товары, в которых есть ЦИФРА "8"*/
USE seminar_1_hw;
SELECT * FROM phones WHERE ProductName RLIKE '[8]';

