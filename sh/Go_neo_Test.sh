#!/bin/bash
#############################################################################
### See: https://neo4j-client.net/
#############################################################################
DBHOST="cheminfov.informatics.indiana.edu"
DBUSR=""
DBPW=""
#
cwd=$(pwd)
#
if [ "$(which cypher-shell)" ]; then
	CQLAPP="cypher-shell"
elif [ "$(which neo4j-client)" ]; then
	CQLAPP="neo4j-client"
else
	echo "ERROR: Neo4j/CQL client app not found."
	exit
fi
printf "CQLAPP = %s\n" "$CQLAPP"
#
#
$CQLAPP -u "$DBUSR" -p "$DBPW" \
	-o ${cwd}/data/example_01_out.txt \
	-i ${cwd}/cql/example_01.cql \
	"$DBHOST"
#
