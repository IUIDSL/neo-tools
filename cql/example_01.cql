// From Chris Gessner

MATCH p=(m:Compound)--(gene:Gene)--(n:Compound {id:'CID:5743'})
WITH m, n, count(distinct gene) AS cg
WHERE cg > 10
WITH m, n
MATCH p=(n)--(:Gene)--(m)
RETURN p ;
