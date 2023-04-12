with t1 as (
    select person_id, pizzeria_id, count(*) as amount_of_orders
    from person_order
    join menu on person_order.menu_id = menu.id
    join pizzeria on menu.pizzeria_id = pizzeria.id
    group by person_id, pizzeria_id
    order by person_id
)
insert into person_discounts
select
    row_number() over (),
    person_id,
    pizzeria_id,
    case
       when amount_of_orders = 1 then 10.5
       when amount_of_orders = 2 then 22
       else 30 end
from t1;