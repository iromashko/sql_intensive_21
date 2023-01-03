select person_id from person_order
where order_date = 'January 7, 2022'
except all
select person_id from person_visits
where visit_date = 'January 7, 2022';
