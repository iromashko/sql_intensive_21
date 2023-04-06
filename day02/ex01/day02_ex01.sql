select cast(period as date) as missing_date
from (select * from person_visits where person_id = 1 or person_id = 2) as person_visits
right join
generate_series('2022-01-01', '2022-01-10', interval '1 day') as period
on visit_date = period
where visit_date is null
order by missing_date;

