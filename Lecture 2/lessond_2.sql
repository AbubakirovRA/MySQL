USE lesson_1; -- Переход в конкретную БД
-- Работа с таблицами из Бд "lesson_1"
-- INSERT table  (column_name1,column_name2) VALUES  (value1, value2)
INSERT student  (id, name, email)
VALUES (7 ,"Oleg", "test123@gmail.com");

-- Переименовать табличку
-- RENAME TABLE старое_имя TO новое_имя
RENAME TABLE  student TO GB;

-- Удаление столбца из БД
/*
ALTER TABLE table_name
DROP COLUMN column_name;
*/
ALTER TABLE gb
DROP COLUMN email;

SELECT * FROM GB;

# Добавить столбец
# ADD COLUMN name type;
ALTER TABLE gb
ADD COLUMN email VARCHAR(45); 
SELECT * FROM GB;

TRUNCATE TABLE GB; -- Очистить табличку (убрать ВСЕ значения)
SELECT * FROM GB;

DROP TABLE GBtest; -- Удалить табличку полностью

-- table creation
CREATE TABLE studentMarks (stud_id INT NOT NULL AUTO_INCREMENT
 PRIMARY KEY, total_marks INT, grade VARCHAR(5));
-- insert sample data
INSERT INTO studentMarks(total_marks, grade)
 VALUES
(450, 'A'), 
(480, 'A+'), 
(490, 'A++'), 
(440, 'B+'),
(400, 'C+'),
(380,'C'),
(250, 'D'),
(200,'E'),
(100,'F'),
(150,'F'),
(220, 'E');
 
SELECT * From studentMarks;

SELECT total_marks, grade,
CASE grade
    WHEN 'A++' THEN 'DISTINCTION'
    WHEN 'A+' THEN 'FIRST CLASS'
    WHEN 'A'  THEN 'FIRST CLASS'
    WHEN 'B' THEN 'SECOND CLASS'
    WHEN 'B+' THEN 'SECOND CLASS'
    WHEN 'C+' THEN 'THIRD CLASS'
    ELSE 'FAIL'
END AS class
FROM studentMarks;


SELECT total_marks, grade,
CASE
   WHEN total_marks >= 450 THEN 'FIRST CLASS WITH DISTINCTION'
   WHEN total_marks >= 400 AND total_marks < 450 THEN 'FIRST CLASS'
   WHEN total_marks >= 350 AND total_marks < 400 THEN 'SECOND CLASS'
   WHEN total_marks >= 300 AND total_marks < 350 THEN 'THIRD CLASS'
   ELSE 'FAIL'
END as class
FROM studentMarks;

-- IF (условие, значение_для_истины, значение_для_лжи)
SELECT IF(100<200, "yes", "no");

-- 450 +  - "Отличник", если меньше "Хорошист"
SELECT total_marks, grade,
IF (total_marks > 450, "Отличник", "Хорошист") AS Status
FROM studentMarks;
