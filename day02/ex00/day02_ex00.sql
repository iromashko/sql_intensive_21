select name
from pizzeria
left join person_visits on pizzeria.id = person_visits.pizzeria_id
where person_visits is null;
