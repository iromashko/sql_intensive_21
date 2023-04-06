select distinct p1.name as person_name1, p2.name as person_name2, p1.address as common_address
from person p1
join person p2 on p1.address = p2.address and p1.id > p2.id
order by p1.name, p2.name, p1.address;