-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

CREATE TABLE student
(
student_id serial,
first_name varchar,
last_name varchar,
birthday date,
phone varchar,

CONSTRAINT pk_student_student_id PRIMARY KEY (student_id)
);

-- 2. Добавить в таблицу student колонку middle_name varchar

ALTER TABLE student ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name

ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date

ALTER TABLE student RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)

ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора

INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES
('Ivan', 'Ivanov', '2000-01-01', '123-456-7890'),
('Maria', 'Petrova', '1999-05-05', '098-765-4321'),
('Alexey', 'Sidorov', '2001-12-12', '567-890-1234');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние

TRUNCATE TABLE student RESTART IDENTITY;