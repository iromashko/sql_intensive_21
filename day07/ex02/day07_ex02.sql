with top_visit as (
        select p.name, count(*) as count, 'visit' as action_type
        from person_visits
        join pizzeria p on person_visits.pizzeria_id = p.id
        group by p.name
        limit 3),
    top_order as (
        select p.name, count(*) as count, 'order' as action_type
        from person_order
        join menu m on person_order.menu_id = m.id
        join pizzeria p on m.pizzeria_id = p.id
        group by p.name
        limit 3)
select name, count, action_type
from top_visit
union
select name, count, action_type
from top_order
order by action_type, count desc;