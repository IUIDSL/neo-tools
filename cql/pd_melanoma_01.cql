MATCH (extraperim:Phenotype {id:'C0015371'}) 
MATCH (parkinson:Phenotype {id:'C0242422'})

CALL apoc.path.spanningTree([extraperim,parkinson], {relationshipFilter:'PAR>',labelFilter:'+Phenotype'}) YIELD path
WITH path AS p1

MATCH (mel:Phenotype {id:'C0025202'})
CALL apoc.path.spanningTree([mel], {relationshipFilter:'PAR>',labelFilter:'+Phenotype'}) YIELD path AS p2
WITH nodes(p1) AS mn1, nodes(p2) AS mn2

UNWIND mn1 AS mn
UNWIND mn2 AS mnn
MATCH path=(mn)-[:geneDisease]-(:Gene)-[:geneDisease]-(mnn)

WITH relationships(path) AS relz
UNWIND relz AS rel
RETURN startNode(rel),rel,endNode(rel)

UNION
MATCH (extraperim:Phenotype {id:'C0015371'}) 
MATCH (parkinson:Phenotype {id:'C0242422'})
CALL apoc.path.spanningTree([extraperim,parkinson], {relationshipFilter:'PAR>',labelFilter:'+Phenotype'}) YIELD path
WITH relationships(path) AS relz
UNWIND relz AS rel
RETURN startNode(rel),rel,endNode(rel)

UNION
MATCH (mel:Phenotype {id:'C0025202'})
CALL apoc.path.spanningTree([mel], {relationshipFilter:'PAR>',labelFilter:'+Phenotype'}) YIELD path
WITH relationships(path) AS relz
UNWIND relz AS rel
RETURN startNode(rel),rel,endNode(rel)
