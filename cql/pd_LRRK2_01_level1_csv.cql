//
MATCH (n:Phenotype {id: 'C0030567'})
MATCH (hs:Gene {id:'ENSG00000188906'})
CALL apoc.path.expandConfig(n, {minLevel:1, maxLevel:1, bfs:false, terminatorNodes:[hs]})
YIELD path
WITH apoc.path.elements(path) AS elements
RETURN
	elements[0].nodeType AS startnode_type,
	elements[0].id AS startnode_id,
	elements[0].label AS startnode_label,
	type(elements[1]) as rel1_type,
	elements[1].score as rel1_score,
	elements[1].source as rel1_source,
	elements[2].nodeType AS endnode_type,
	elements[2].id AS endnode_id,
	elements[2].label AS endnode_label
ORDER BY rel1_score DESC
	;
