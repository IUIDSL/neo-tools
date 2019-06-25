MATCH (n) WITH n, size((n)-[]-()) AS degree
RETURN n.label, degree, labels(n)
ORDER BY degree DESC LIMIT 100 ;
