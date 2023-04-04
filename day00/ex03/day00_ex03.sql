select distinct person_id
from person_visits
where visit_date between 'January 1, 2022' and 'January 9, 2022' or pizzeria_id = 2
order by person_id desc;