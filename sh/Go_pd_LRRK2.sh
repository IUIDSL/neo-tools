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
CQLFILE="${cwd}/cql/pd_LRRK2_01.cql"
OUTFILE="${DATADIR}/pd_LRRK2_01.csv"
#
$CQLAPP "$DBHOST" <${CQLFILE} >$OUTFILE
#
