SELECT name, MAX(salary) salary
FROM worker
WHERE salary = (SELECT MAX(salary) FROM worker)
group by name;