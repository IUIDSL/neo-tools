MATCH
	(jak:Resource {uri:'http://chem2bio2rdf.org/uniprot/resource/gene/JAK1'})
MATCH
	p=(n:Resource {uri:'http://chem2bio2rdf.org/omim/resource/omim_disease/427'})-[*3]-()
WITH
	jak, nodes(p) as mnodes
UNWIND
	mnodes AS nn
WITH
	jak,nn WHERE nn:ns17__omim_disease
WITH
	shortestPath((nn)-[*1..10]-(jak)) AS path
WITH
	relationships(path) AS rel
UNWIND
	rel AS relr
RETURN
	startNode(relr), relr, endNode(relr)
LIMIT 20000
	;
