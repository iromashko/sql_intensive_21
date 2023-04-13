with top_visit as (
        select p.name, count(*) as count, 'visit' as action_type
        from person_visits
        join pizzeria p on person_visits.pizzeria_id = p.id
        group by p.name),
    top_order as (
        select p.name, count(*) as count, 'order' as action_type
        from person_order
        join menu m on person_order.menu_id = m.id
        join pizzeria p on m.pizzeria_id = p.id
        group by p.name),
    top as (select * from top_visit union all select * from top_order)
select name, sum(count) as total_count
from top
group by name
order by total_count desc;