select person.name
from person_order
join menu on person_order.menu_id = menu.id
join person on person_order.person_id = person.id
where (pizza_name = 'pepperoni pizza' or  pizza_name = 'mushroom pizza') and
      gender = 'male' and (address = 'Moscow' or address = 'Samara')
order by person.name desc;



