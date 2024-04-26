SELECT 'YOUNGEST' type, name, w.birthday
FROM worker w
WHERE now() - w.birthday = (SELECT MAX(now() - birthday) FROM worker)
union
SELECT 'ELDEST' type, name, w.birthday
FROM worker w
WHERE now() - w.birthday = (SELECT MIN(now() - birthday) FROM worker);
