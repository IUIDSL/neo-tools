MATCH (d:Phenotype {label:'Parkinson Disease'})-[r]-(o)
	RETURN d.label, r.source, o.nodeType, o.label ;
