create index if not exists idx_person_name on person(upper(name));
-- drop index if exists idx_person_name;

set enable_seqscan = off;

explain analyse
select *
from person
where upper(name) is not null;
