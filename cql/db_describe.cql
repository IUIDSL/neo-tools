// Node counts:
MATCH (n) RETURN "NODES (All): "+toString(COUNT(n)) ;

MATCH (n:Compound) RETURN "NODES (Compound): "+toString(COUNT(n)) ;
MATCH (n:Gene) RETURN "NODES (Gene): "+toString(COUNT(n)) ;
MATCH (n:GCompound) RETURN "NODES (GCompound): "+toString(COUNT(n)) ;
MATCH (n:Phenotype) RETURN "NODES (Phenotype): "+toString(COUNT(n)) ;
MATCH (n:Tissue) RETURN "NODES (Tissue): "+toString(COUNT(n)) ;
MATCH (n:Pathway) RETURN "NODES (Pathway): "+toString(COUNT(n)) ;
MATCH (n:TargetFamily) RETURN "NODES (TargetFamily): "+toString(COUNT(n)) ;

// Relationship counts:
MATCH ()-[r]-() RETURN "RELATIONSHIPS (All): "+toString(COUNT(r)) ;

MATCH ()-[r:pathwayGene]-() RETURN "RELATIONSHIPS (pathwayGene): "+toString(COUNT(r)) ;
MATCH ()-[r:geneTissue]-() RETURN "RELATIONSHIPS (geneTissue): "+toString(COUNT(r)) ;

