create index if not exists idx_person_visits_person_id on public.person_visits(person_id);
create index if not exists idx_person_visits_pizzeria_id on public.person_visits(pizzeria_id);

create index if not exists idx_menu_pizzeria_id on public.menu(pizzeria_id);
create index if not exists idx_menu_pizza_name on public.menu(pizza_name);

create index if not exists idx_person_order_person_id on public.person_order(person_id);
create index if not exists idx_person_order_menu_id on public.person_order(menu_id);
