MATCH
	(park:Resource {uri:'http://chem2bio2rdf.org/omim/resource/omim_disease/1192'})
CALL
	apoc.path.expandConfig(park,{maxLevel:10,uniqueness:"NODE_GLOBAL",bfs:true,labelFilter:'+ns17__omim_disease|+ns17__omim_gene'}) YIELD path
WITH
	relationships(path) AS relz
UNWIND
	relz AS rel
RETURN
	startNode(rel),rel,endNode(rel)
limit 50000
	;
