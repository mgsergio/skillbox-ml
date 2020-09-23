-- 1. Написать запрос для выбора студентов в порядке их регистрации на сервисе.
-- 2. Написать запрос для выбора 5 самых дорогих курсов, на которых более 4 студентов,
--    и которые длятся более 10 часов.
-- 3. Написать один (!) запрос, который выведет одновременно список из имен трёх самых
--    молодых студентов, имен трёх самых старых учителей и названий трёх самых
--    продолжительных курсов.
-- I
select *
from Students
order by registration_date asc;
-- II
select *
from Courses
where students_count > 5
    and duration > 10
order by price desc
limit 5;
-- III
(
    select name
    from Students
    order by age asc
    limit 3
)
UNION ALL
(
    select name
    from Teachers
    order by age desc
    limit 3
)
UNION ALL
(
    select name
    from Courses
    order by duration desc
    limit 3
);
