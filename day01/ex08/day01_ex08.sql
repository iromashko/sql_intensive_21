select order_date, concat(name, '(age:', age, ')') as person_information
from (select person_id as id, order_date from person_order) as po
natural join person
order by order_date, person_information;
