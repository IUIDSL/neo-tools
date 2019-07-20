MATCH (n:Phenotype {id: 'C0030567'})
MATCH (hs:Gene {id:'ENSG00000188906'})
CALL apoc.path.expandConfig(n, {minLevel:2, maxLevel:2, bfs:false, terminatorNodes:[hs]})
YIELD path
WITH apoc.path.elements(path) AS elements
RETURN elements
	;
