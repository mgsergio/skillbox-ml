-- 1. Напишите запрос, который выводит сумму, сколько часов должен в итоге проучиться каждый
--    студент (сумма длительности всех курсов на которые он подписан).
--    В результате запрос возвращает две колонки: Имя Студента — Кол-во часов.
-- 2. Напишите запрос, который посчитает для каждого учителя средний возраст его учеников.
--    В результате запрос возвращает две колонки: Имя Учителя — Средний Возраст Учеников.
-- 3. Напишите запрос, который выводит среднюю зарплату учителей для каждого типа курса
--    (Дизайн/Программирование/Маркетинг и т.д.).
--    В результате запрос возвращает две колонки: Тип Курса — Средняя зарплата.
-- I
select st.name,
    sum(c.duration) as `total duration`
from Students st
    join Subscriptions sb on st.id = sb.student_id
    join Courses c on c.id = sb.course_id
group by st.name;
-- II
select t.name,
    avg(st.age) as `avg student age`
from Students st
    join Subscriptions sb on st.id = sb.student_id
    join Courses c on c.id = sb.course_id
    join Teachers t on t.id = c.teacher_id
group by t.name;
-- III
select avg(t.salary) as `avg salary`,
    c.type as `course type`
from Teachers t
    join Courses c on c.teacher_id = t.id
group by c.type;
