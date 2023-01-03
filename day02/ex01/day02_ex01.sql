select cast(period as date) as missing_date
from (select * from person_visits where person_id = 1 or person_id = 2) as pv
right outer join
generate_series(timestamp '2022-01-01', timestamp '2022-01-10', interval '1 day') as period
on visit_date = cast(period as date)
where person_id is null
order by missing_date;
