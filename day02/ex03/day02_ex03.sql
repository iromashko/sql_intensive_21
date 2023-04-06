with dates_cte as (
    select cast(period AS date) as missing_date
    from generate_series('2022-01-01', '2022-01-10', interval '1 day') as period)
select dates_cte.missing_date as missing_date
from (select * from person_visits where person_id = 1 or person_id = 2) as person_visits
right join dates_cte on visit_date = dates_cte.missing_date
where visit_date is null
order by missing_date;