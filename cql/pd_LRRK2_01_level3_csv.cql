//
MATCH (n:Phenotype {id: 'C0030567'})
MATCH (hs:Gene {id:'ENSG00000188906'})
CALL apoc.path.expandConfig(n, {minLevel:3, maxLevel:3, bfs:false, terminatorNodes:[hs]})
YIELD path
WITH apoc.path.elements(path) AS elements
RETURN
	elements[0].nodeType AS startnode_type,
	elements[0].id AS startnode_id,
	elements[0].label AS startnode_label,
	type(elements[1]) as rel1_type,
	elements[1].score as rel1_score,
	elements[1].source as rel1_source,
	elements[2].nodeType AS mid1node_type,
	elements[2].id AS mid1node_id,
	elements[2].label AS mid1node_label,
	type(elements[3]) as rel3_type,
	elements[3].score as rel3_score,
	elements[3].source as rel3_source,
	elements[4].nodeType AS mid2node_type,
	elements[4].id AS mid2node_id,
	elements[4].label AS mid2node_label,
	type(elements[5]) as rel5_type,
	elements[5].score as rel5_score,
	elements[5].source as rel5_source,
	elements[6].nodeType AS endnode_type,
	elements[6].id AS endnode_id,
	elements[6].label AS endnode_label
ORDER BY rel1_score DESC, rel3_score DESC, rel5_score DESC
	;
