with persons as (select gender, p2.name as pizzeria_name
                 from person_visits
                 join person p on person_visits.person_id = p.id
                 join pizzeria p2 on person_visits.pizzeria_id = p2.id),
    men as (select pizzeria_name from persons where gender = 'male'),
    women as (select pizzeria_name from persons where gender = 'female')
select pizzeria_name
from (
    (select * from men except all select * from women)
    union all
    (select * from women except all select  * from men)) as t1
order by pizzeria_name;
