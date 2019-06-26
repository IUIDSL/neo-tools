// Find PD phenotypes and rank by degree.
MATCH (d:Phenotype)--(o)
	WHERE d.label CONTAINS 'Parkinson'
	RETURN d.label, count(*) AS degree
	ORDER BY degree DESC ;

MATCH (d:Phenotype)-[]->(o)
	WHERE d.label CONTAINS 'Parkinson'
	RETURN d.label, o.nodeType, count(*) AS degree
	ORDER BY degree DESC ;

MATCH (d:Phenotype)-[r]->()
	WHERE d.label CONTAINS 'Parkinson'
	RETURN d.label, type(r), count(*) AS degree
	ORDER BY degree DESC ;

MATCH (d:Phenotype)-[]-(o:Compound)
	WHERE d.label CONTAINS 'Parkinson'
	WITH d, o, count((d)-[]-(o)) AS degree
	RETURN d.nodeType, d.label, degree, o.nodeType, o.label
	ORDER BY degree DESC ;
