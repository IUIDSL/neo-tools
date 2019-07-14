// (From Chris Gessner)
MATCH (n:Phenotype {id: 'C0030567'})
MATCH (hs:Gene {id:'ENSG00000188906'})
CALL apoc.path.expandConfig(n, {maxLevel:3, bfs:false, terminatorNodes:[hs]}) YIELD path
WITH relationships(path) AS rel
UNWIND rel AS relr
WITH relr
WHERE startNode(relr).id <> "GO:0005515" AND endNode(relr).id <> "GO:0005515"
RETURN startNode(relr).id, relr, endNode(relr)
	;
