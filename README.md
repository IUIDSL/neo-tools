# neo-tools

Code, tools, workflows and documentation for effective use of Neo4j.

IDSL members feel free to contribute.

## Installing Neo4j on Ubuntu per [Neo4j.org Documentation](http://debian.neo4j.org/?_ga=2.21023219.978494451.1558286625-1437053884.1535730472)

```
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt update
sudo apt install neo4j
sudo apt install neo4j-client
```

## neo4j-client

This is 3rd party package available for various systems. See

* <https://neo4j-client.net/>

### neo4j.conf

See [neo4j.conf](conf/neo4j/neo4j.conf).
Some important options:

```
# Whether requests to Neo4j are authenticated.
# To disable authentication, uncomment this line
dbms.security.auth_enabled=false

# With default configuration Neo4j only accepts local connections.
# To accept non-local connections, uncomment this line:
dbms.connectors.default_listen_address=0.0.0.0
```
