select p.name, count(person_id) as count_of_visits
from person_visits
join person p on person_visits.person_id = p.id
group by p.name
having count(person_id) > 3;
