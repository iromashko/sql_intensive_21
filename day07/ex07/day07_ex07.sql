select round(sum(rating) / count(*), 4) as global_rating
from pizzeria;