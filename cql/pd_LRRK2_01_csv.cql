// (From Chris Gessner)
// To do: include protein binding (GO:0005515) with appropriate 
// threshold and/or degree weighting.
MATCH (n:Phenotype {id: 'C0030567'})
MATCH (hs:Gene {id:'ENSG00000188906'})
CALL apoc.path.expandConfig(n, {maxLevel:3, bfs:false, terminatorNodes:[hs]})
YIELD path WITH relationships(path) AS rel
UNWIND rel AS relr
WITH relr
WHERE startNode(relr).id <> "GO:0005515" AND endNode(relr).id <> "GO:0005515"
RETURN
	startNode(relr).nodeType AS startnode_type,
	startNode(relr).id AS startnode_id,
	startNode(relr).label AS startnode_label,
	type(relr) AS rel_type,
	relr.source AS rel_source,
	relr.score as score,
	endNode(relr).nodeType AS endnode_type,
	endNode(relr).id AS endnode_id,
	endNode(relr).label AS endnode_label
ORDER BY score DESC
	;
