select coalesce(person.name, '-') as person_name, vd.visit_date, coalesce(pizzeria.name, '-') as pizzeria_name
from (select * from person_visits
      where visit_date between 'January 1, 2022' and 'January 3, 2022') as vd
full join person on person.id = vd.person_id
full join pizzeria on pizzeria.id = vd.pizzeria_id
order by person_name, vd.visit_date, pizzeria_name;
