/* «Операторы, фильтрация, сортировка и ограничение». Для задания 1. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at, created_at, updated_at)
values
/* Первоначально дата создания\модификации заполнялась NULLом, теперь - текущим временем
  ('Геннадий', '1990-10-05', NULL, NULL),
  ('Наталья', '1984-11-12', NULL, NULL),
  ('Александр', '1985-05-20', NULL, NULL),
  ('Сергей', '1988-02-14', NULL, NULL),
  ('Иван', '1998-01-12', NULL, NULL),
  ('Мария', '2006-08-29', NULL, NULL);
  */
 ('Геннадий', '1990-10-05', NOW(), NOW()),
 ('Наталья', '1984-11-12', NOW(), NOW()),
 ('Александр', '1985-05-20', NOW(), NOW()),
 ('Сергей', '1988-02-14', NOW(), NOW()),
 ('Иван', '1998-01-12', NOW(), NOW()),
 ('Мария', '2006-08-29', NOW(), NOW());
/*вывели полученный результат - дата\время изменена на текущую*/
select * from users;

/* «Операторы, фильтрация, сортировка и ограничение». Для задания 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';


INSERT INTO
  users (name, birthday_at, created_at, updated_at)
values
  ('Геннадий', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
  ('Наталья', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
  ('Александр', '1985-05-20', '14.08.2016 10:10', '14.08.2016 10:10'),
  ('Сергей', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
  ('Иван', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
  ('Мария', '2006-08-29', '12.01.2017 8:56', '12.01.2017 8:56');

/* 
 Добавляем две промежуточные колонки в нужном формате datetime.
 Далее преобразовываем функцией STR_TO_DATE строчку из оригинальных колонок (обращая внимание, что это 24-часовой формат)
 Записываем ее в промежуточные колонки, после чего удаляем оригинал и переименовываем новые колонки
 */
ALTER TABLE users
ADD created_at_datetime DATETIME;
ALTER TABLE users
ADD updated_at_datetime DATETIME;
UPDATE users
SET created_at_datetime = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at_datetime = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
  ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_datetime TO created_at, RENAME COLUMN updated_at_datetime TO updated_at;

  select * from users;
   
/* «Операторы, фильтрация, сортировка и ограничение». Для задания 3. */
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO
  storehouses_products (storehouse_id, product_id, value)
VALUES
  (1, 543, 0),
  (1, 789, 2500),
  (1, 3432, 0),
  (1, 826, 30),
  (1, 719, 500),
  (1, 638, 1);
 
 SELECT 
    value
FROM
    storehouses_products ORDER BY CASE WHEN value = 0 then 1 else 0 end, value;
  
/* «Операторы, фильтрация, сортировка и ограничение». Для задания 4. */
/* «Агрегация данных». Для заданий 1, 2. */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO
  users (name, birthday_at)
VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '2006-08-29');

/* «Операторы, фильтрация, сортировка и ограничение». Для задания 5. */
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

/* «Агрегация данных». Для задания 3. */
DROP TABLE IF EXISTS x;
 CREATE TABLE x (id INT PRIMARY KEY);

INSERT INTO x VALUES (1), (2), (3), (4), (5);