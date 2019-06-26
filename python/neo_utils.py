#!/usr/bin/env python3
#############################################################################
### https://py2neo.org/
#############################################################################
import sys,os,argparse
import py2neo

DBHOST="localhost"
DBPORT=7687
DBSCHEME="bolt"
DBUSER="neo4j"
DBPW="neo4j"

#############################################################################
if __name__=='__main__':
  parser = argparse.ArgumentParser(description='Neo4j client (via py2neo API)',
	epilog='See https://neo4j.com/docs/cypher-manual, https://py2neo.org')
  ops = ['dbinfo', 'query', 'dbsummary']
  parser.add_argument("op", choices=ops, help='operation')
  parser.add_argument("--i", dest="ifile", help="input query file (CQL aka Cypher)")
  parser.add_argument("--cql", help="input query (CQL aka Cypher)")
  parser.add_argument("--o", dest="ofile", help="output (TSV)")
  parser.add_argument("--dbhost", default=DBHOST)
  parser.add_argument("--dbport", type=int, default=DBPORT)
  parser.add_argument("--dbscheme", default=DBSCHEME)
  parser.add_argument("--dbuser", default=DBUSER)
  parser.add_argument("--dbpw", default=DBPW)
  parser.add_argument("-v", "--verbose", default=0, action="count")
  args = parser.parse_args()

  PROG=os.path.basename(sys.argv[0])

  try:
    db = py2neo.Database(host=args.dbhost, port=args.dbport, scheme=args.dbscheme, secure=False, user=args.dbuser, password=args.dbpw)
  except Exception as e:
    parser.error('%s'%(e))

  if args.op == 'dbinfo':
    print('db.uri: %s'%(str(db.uri)), file=sys.stderr)
    print('db.name: %s'%(db.name), file=sys.stderr)
    print('db.default_graph: %s'%(str(db.default_graph)), file=sys.stderr)
    print('db.product: %s'%(str(db.product)), file=sys.stderr)

  elif args.op == 'dbsummary':

    g = db.default_graph
    print('nodes %d'%(len(g.nodes)), file=sys.stderr)

    # db.config
    # dictionary of the configuration parameters used to configure Neo4j.
    #print('db.config: %s'%(str(db.config)), file=sys.stderr)

    # db.kernel_version
    # version of Neo4j.
    #print('db.kernel_version: %s'%(str(db.kernel_version)), file=sys.stderr)

    # db.primitive_counts
    # dictionary of estimates of the numbers of different kinds of Neo4j primitives.
    #print('db.primitive_counts: %s'%(str(db.primitive_counts)), file=sys.stderr)

  else:
    parser.error('Unsupported operation: %s'%args.op)
