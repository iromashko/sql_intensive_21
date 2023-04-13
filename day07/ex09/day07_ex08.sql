with t1 as (
    select
        address,
        round(max(age) - cast(min(age) as dec(6,2)) / max(age), 2) as formula,
        round(avg(age), 2 ) as average
    from person
    group by address
)
select address, formula, average, (formula > average) as comparison
from t1
order by address;