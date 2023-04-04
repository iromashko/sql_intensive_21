select (select name from person where id = pv.person_id) as person_name,
        (select name from pizzeria where id = pv.pizzeria_id) as pizzeria_name
from (select * from person_visits
        where visit_date between 'January 7, 2022' and 'January 9, 2022') as pv
order by person_name, pizzeria_name desc;