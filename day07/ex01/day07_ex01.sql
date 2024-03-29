select name, count(*) as count_of_visits
from person_visits
join person p on person_visits.person_id = p.id
group by name
order by count_of_visits desc, name
limit 4;