select pizza_name as object_name from menu
union all
select name as object_name from person
order by object_name;
