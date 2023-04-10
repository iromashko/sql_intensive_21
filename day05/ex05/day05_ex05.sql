create unique index if not exists idx_person_order_order_date on person_order(person_id, menu_id)
where order_date = '2022-01-01';

-- drop index if exists idx_person_order_order_date;

explain analyse
select person_id, menu_id
from person_order
where order_date = '2022-01-01';
