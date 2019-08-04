#!/bin/bash
#############################################################################
### See: https://neo4j-client.net/
### See: https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/
#############################################################################
#
DBHOST="cheminfov.informatics.indiana.edu"
#
cwd=$(pwd)
DATADIR=${cwd}/data
#
if [ "$(which neo4j-client)" ]; then
	CQLAPP="neo4j-client"
else
	echo "ERROR: Neo4j-Client not found."
	exit
fi
#
INFILE="${DATADIR}/pd_phenotypes.tsv"
OUTFILE="${DATADIR}/pd_out.csv"
tmpfile="${DATADIR}/pd_tmp.csv"
rm -f $OUTFILE ; touch $OUTFILE
#
n_terms=$(($(cat $INFILE |wc -l) - 1))
i=0
while [ $i -le $n_terms ]; do
	#
	i=$(($i + 1))
	#
	term=$(cat $INFILE \
		|sed -e '1d' \
		|sed -e "${i}q;d" \
		|awk -F '\t' '{print $2}')
	if [ ! "${term}" ]; then
		continue
	fi
	printf "%d. \"%s\"\n" "${i}" "${term}"
	term=$(echo $term |perl -pe "s/'/\\\\'/g")
	#
	($CQLAPP "$DBHOST" <<__EOF__
MATCH (d:Phenotype {label:'${term}'})-[r]-(o)
	RETURN d.label, r.source, o.nodeType, o.label ;
__EOF__
	) >$tmpfile
	#
	printf "\thits: %d\n" $(($(cat $tmpfile |wc -l) - 1))
	if [ $i = 1 ]; then
		cat $tmpfile >$OUTFILE
	else
		cat $tmpfile |sed -e '1d' >>$OUTFILE
	fi
	rm -f $tmpfile
	#
done
#
#
