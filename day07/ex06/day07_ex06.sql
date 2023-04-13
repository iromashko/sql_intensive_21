select
    p.name,
    count(p.name) as count_of_orders,
    round(sum(m.price) / count(p.name)) as average_price,
    max(m.price) as max_price,
    min(m.price) as min_price
from person_order
join menu m on person_order.menu_id = m.id
join pizzeria p on m.pizzeria_id = p.id
group by p.name
order by p.name;