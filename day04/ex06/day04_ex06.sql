create materialized view mv_dmitriy_visits_and_eats as
select piz.name as pizzeria_name
from person p join person_visits pv on p.id = pv.person_id
              join pizzeria piz on pv.pizzeria_id = piz.id
              join menu m on piz.id = m.pizzeria_id
where p.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800;
