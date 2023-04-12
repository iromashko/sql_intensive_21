select person.name, pizza_name, price, price - price * (discount / 100) as discount_price
from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join person_discounts pd on person.id = pd.person_id and menu.pizzeria_id = pd.pizzeria_id
order by person.name, pizza_name;