#!/bin/bash
#
DBHOST="cheminfov.informatics.indiana.edu"
DBUSR=""
DBPW=""
#
neo4j-client -u "$DBUSR" -p "$DBPW" \
	-o data/example_01_out.txt \
	-i cql/example_01.cql \
	"$DBHOST"
#
