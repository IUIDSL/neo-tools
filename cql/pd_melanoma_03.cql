// Note extraperim is here for reference - but not shown in figs above AS didnt change order of the top 10 pathways
// AS always LIMITs are adjusted at the time of actual query - eg no limit
// in this case needed to create cytoscape sif file instead of direct query in cytoscape
// then formatter to create node,edge,node',node'Attribute for sif format

MATCH (park:Phenotype {id:'C0242422'})
MATCH (mel:Phenotype {id:'C0025202'})
MATCH p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 20
UNION all
MATCH (park:Phenotype {id:'C0242422'})
MATCH (mel:Phenotype {id:'C0025202'})
MATCH  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 10
UNION all
//extraperim

MATCH (park:Phenotype {id:'C0015371'}) 
MATCH (mel:Phenotype {id:'C0025202'})
MATCH p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 20
UNION all
MATCH (park:Phenotype {id:'C0015371'}) 
MATCH (mel:Phenotype {id:'C0025202'})
MATCH  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 10
UNION all
//PD

MATCH (park:Phenotype {id:'C0030567'}) 
MATCH (mel:Phenotype {id:'C0025202'})
MATCH p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 20
UNION all
MATCH (park:Phenotype {id:'C0030567'}) 
MATCH (mel:Phenotype {id:'C0025202'})
MATCH  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
RETURN (park.id), "pw1", (pw.id) AS pw1, pw.label AS l1, "\n", mel.id, "pw", pw.id AS pw2, pw.label AS l2
LIMIT 10
 ;
