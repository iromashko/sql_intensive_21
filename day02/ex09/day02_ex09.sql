select name
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
where gender = 'female' and pizza_name = 'pepperoni pizza' and exists (
    select *
    from person_order
    join menu on person_order.menu_id = menu.id
    where person_order.person_id = person.id and menu.pizza_name = 'cheese pizza')
