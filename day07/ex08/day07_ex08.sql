select address, p2.name, count(address)
from person_order
join person p on person_order.person_id = p.id
join menu m on person_order.menu_id = m.id
join pizzeria p2 on m.pizzeria_id = p2.id
group by address, p2.name
order by address;