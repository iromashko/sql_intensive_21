select pizzeria.name from person_visits
join person on person_visits.person_id = person.id
join menu on person_visits.pizzeria_id = menu.pizzeria_id
join pizzeria on person_visits.pizzeria_id = pizzeria.id
where visit_date ='January 8, 2022' and menu.price < 800;

