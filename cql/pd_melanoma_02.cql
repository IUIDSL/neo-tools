//note extraperim is here for reference - but not shown in figs above as didnt change order of the top 10 pathways
//as always limits are adjusted at the time of actual query - eg no limit
// in this case needed to create cytoscape sif file instead of direct query in cytoscape
// then formatter to create node,edge,node',node'Attribute for sif format

match (park:Phenotype {id:'C0242422'})
match (mel:Phenotype {id:'C0025202'})
match p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 20
union all
match (park:Phenotype {id:'C0242422'})
match (mel:Phenotype {id:'C0025202'})
match  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 10
union all

//extraperim

match (park:Phenotype {id:'C0015371'}) 
match (mel:Phenotype {id:'C0025202'})
match p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 20
union all
match (park:Phenotype {id:'C0015371'}) 
match (mel:Phenotype {id:'C0025202'})
match  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 10
union all
//PD

match (park:Phenotype {id:'C0030567'}) 
match (mel:Phenotype {id:'C0025202'})
match p1=(park)-[:geneDisease]-(:Gene)-[:pathwayGene]-(pw:Pathway)-[:pathwayGene]-(:Gene)-[:geneDisease]-(mel)
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 20
union all
match (park:Phenotype {id:'C0030567'}) 
match (mel:Phenotype {id:'C0025202'})
match  p1 = (park)-[:geneDisease]-(g:Gene),(g)-[:geneDisease]-(mel), (g)-[:pathwayGene]-(pw:Pathway )
return (park.id), "pw1", (pw.id) as pw1, pw.label as l1, "\n", mel.id, "pw", pw.id as pw2, pw.label as l2
limit 10
