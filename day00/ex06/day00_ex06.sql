select name, (case when name='Denis' then 'true' else 'false' end) as check_name
from person
where id in (select person_id from person_order
             where menu_id in (13, 14, 18) and order_date = 'January 7, 2022');
