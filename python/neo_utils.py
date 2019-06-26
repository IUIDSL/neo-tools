#!/usr/bin/env python3
#############################################################################
### https://py2neo.org/
### https://py2neo.org/v4/database.html
#############################################################################
import sys,os,argparse,json
import pandas
import py2neo

DBHOST="localhost"
DBPORT=7687
DBSCHEME="bolt"
DBUSER="neo4j"
DBPW="neo4j"

#############################################################################
def DbInfo(db, verbose):
  print('db.uri: %s'%(str(db.uri)), file=sys.stderr)
  print('db.name: %s'%(db.name), file=sys.stderr)
  print('db.default_graph: %s'%(str(db.default_graph)), file=sys.stderr)
  print('db.product: %s'%(str(db.product)), file=sys.stderr)
  if verbose:
    print('db.config: %s'%(str(db.config)), file=sys.stderr)

#############################################################################
def DbSummary(db, verbose):
  DbInfo(db, verbose)
  print('db.kernel_version: %s'%(str(db.kernel_version)), file=sys.stderr)
  print('db.primitive_counts: %s'%(str(db.primitive_counts)), file=sys.stderr)
  print('nodes: %d; relationships: %d'%(len(g.nodes), len(g.relationships)), file=sys.stderr)

#############################################################################
def DbQuery(db, cql, fmt, fout, verbose):
  g = db.default_graph
  if fmt.upper()=='JSON':
    rows = g.run(cql).data()
    fout.write(json.dumps(rows, indent=2)+'\n')
    print('rows: %d'%(len(rows)), file=sys.stderr)

    ### How to get keys/dict?
    #for row in g.run(cql):
    #  fout.write(json.dumps(row, indent=2))
  else:
    df = g.run(cql).to_data_frame()
    df.to_csv(fout, '\t', index=False)
    print('rows: %d'%(df.shape[0]), file=sys.stderr)

#############################################################################
if __name__=='__main__':
  parser = argparse.ArgumentParser(description='Neo4j client (via py2neo API)',
	epilog='See https://neo4j.com/docs/cypher-manual, https://py2neo.org')
  ops = ['dbinfo', 'query', 'dbsummary']
  parser.add_argument("op", choices=ops, help='operation')
  parser.add_argument("--i", dest="ifile", help="input query file (CQL aka Cypher)")
  parser.add_argument("--cql", help="input query (CQL aka Cypher)")
  parser.add_argument("--o", dest="ofile", help="output (TSV|JSON)")
  parser.add_argument("--ofmt", choices=('TSV', 'JSON'), default='TSV')
  parser.add_argument("--dbhost", default=DBHOST)
  parser.add_argument("--dbport", type=int, default=DBPORT)
  parser.add_argument("--dbscheme", default=DBSCHEME)
  parser.add_argument("--dbuser", default=DBUSER)
  parser.add_argument("--dbpw", default=DBPW)
  parser.add_argument("-v", "--verbose", default=0, action="count")
  args = parser.parse_args()

  PROG=os.path.basename(sys.argv[0])

  if args.ofile:
    fout = open(args.ofile, "w")
  else:
    fout = sys.stdout

  try:
    db = py2neo.Database(host=args.dbhost, port=args.dbport, scheme=args.dbscheme, secure=False, user=args.dbuser, password=args.dbpw)
  except Exception as e:
    parser.error('%s'%(e))

  if args.op == 'dbinfo':
    DbInfo(db, args.verbose)

  elif args.op == 'dbsummary':
    DbSummary(db, args.verbose)

  elif args.op == 'query':
    if args.ifile:
      fin = open(args.ifile)
      cql = fin.read()
    elif args.cql:
      cql = args.cql
    else:
      parser.error('--cql or --i required for query.')
    DbQuery(db, cql, args.ofmt, fout, args.verbose)

  else:
    parser.error('Unsupported operation: %s'%args.op)
