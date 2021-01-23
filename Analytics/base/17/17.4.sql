-- 1. Написать запрос для выбора среднего возраста всех учителей с зарплатой более 10 000.
-- 2. Написать запрос для расчета суммы, сколько будет стоить купить все курсы по дизайну.
-- 3. Написать запрос для расчёта, сколько минут (!) длятся все курсы по программированию.
-- I
select avg(age)
from Teachers
where salary > 10000;
-- II
select sum(price)
from Courses
where `type` = 'DESIGN';
-- III
select sum(duration) * 60
from Courses
where `type` = 'PROGRAMMING';
