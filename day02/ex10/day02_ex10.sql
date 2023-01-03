select person.name as person_name, pizza_name, pizzeria.name as pizzeria_name
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
order by person_name, pizza_name, pizzeria_name;
