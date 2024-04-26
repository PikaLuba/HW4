select p.name, ttt.count_month * tt.sum_salary price
from progect p, (select pw.progect_id progect_id, sum(w.salary) sum_salary
                  from progect_worker pw, worker w
                  where pw.worker_id = w.id 
                  group by  pw.progect_id) tt,
				  
                (select p.id progect_id, (DATE_PART('year', p.finish_date) - DATE_PART('year', p.start_date)) * 12 +
						(DATE_PART('month', p.finish_date) - DATE_PART('month', p.start_date)) count_month
                  from progect p) ttt
where p.id = tt.progect_id and 
      p.id = ttt.progect_id
order by ttt.count_month * tt.sum_salary desc; 