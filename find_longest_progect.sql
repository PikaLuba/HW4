select p.name, max(tt.count_month) month_count
from progect p, (select pp.id, 
				 (DATE_PART('year', pp.finish_date) - DATE_PART('year', pp.start_date)) * 12 +
					(DATE_PART('month', pp.finish_date) - DATE_PART('month', pp.start_date)) count_month
				from progect pp) tt
where p.id = tt.id and
tt.count_month = (SELECT max((DATE_PART('year', finish_date) - DATE_PART('year', start_date)) * 12 +
					(DATE_PART('month', finish_date) - DATE_PART('month', start_date))) FROM progect
				 )
group by p.name;