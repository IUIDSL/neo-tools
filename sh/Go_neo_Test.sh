#!/bin/bash
#############################################################################
### See: https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/
### See: https://neo4j-client.net/
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
#
if [ "$(which neo4j-client)" ]; then
	CQLAPP="neo4j-client"
	printf "CQLAPP = %s\n" "$CQLAPP"
	#
	$CQLAPP -i ${CQLFILE} "$DBHOST"
	#
elif [ "$(which cypher-shell)" ]; then
	CQLAPP="cypher-shell"
	printf "CQLAPP = %s\n" "$CQLAPP"
	#
	$CQLAPP -a "bolt://${DBHOST}:7687" \
		--non-interactive \
		--format "plain" \
		<${CQLFILE}
	#
else
	echo "ERROR: Neo4j/CQL client app not found."
	exit
fi
#
