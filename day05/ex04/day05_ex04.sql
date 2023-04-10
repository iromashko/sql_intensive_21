create unique index if not exists idx_menu_unique on menu(pizzeria_id, pizza_name);
-- drop index if exists idx_menu_unique;

set enable_seqscan = off;
set enable_indexscan = on;

explain analyse
select pizzeria_id, pizza_name
from menu;