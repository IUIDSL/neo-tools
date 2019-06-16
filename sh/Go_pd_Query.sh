#!/bin/bash
#############################################################################
### See: https://neo4j-client.net/
### See: https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/
#############################################################################
#
if [ $# -lt 1 ]; then
	printf "ERROR: Syntax: %s CQLFILE\n" $(basename $0)
else
	CQLFILE=$1
fi
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
OUTFILE="${DATADIR}/pd_out.tsv"
#
n_terms=$(($(cat $INFILE |wc -l) - 1))
#
$CQLAPP -i ${CQLFILE} "$DBHOST"
#
