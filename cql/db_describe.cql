// Node counts:
MATCH (n) RETURN COUNT(n) AS NODES_All ;

MATCH (n:Compound) RETURN COUNT(n) AS NODES_Compound ;
MATCH (n:Gene) RETURN COUNT(n) AS NODES_Gene ;
MATCH (n:GCompound) RETURN COUNT(n) AS NODES_GCompound ;
MATCH (n:Phenotype) RETURN COUNT(n) AS NODES_Phenotype;
MATCH (n:Tissue) RETURN COUNT(n) AS NODES_Tissue;
MATCH (n:Pathway) RETURN COUNT(n) AS NODES_Pathway;
MATCH (n:TargetFamily) RETURN COUNT(n) AS NODES_TargetFamily;


// Relationship counts:
MATCH ()-[r]-() RETURN COUNT(r) AS RELATIONSHIPS_All ;
MATCH ()-[r:pathwayGene]-() RETURN COUNT(r) AS RELATIONSHIPS_pathwayGene ;
MATCH ()-[r:geneTissue]-() RETURN COUNT(r) AS RELATIONSHIPS_geneTissue ;
