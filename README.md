# What is Neo4j?

Neo4j is an open-source graph database, implemented in Java. The developers describe Neo4j as "embedded, disk-based, fully transactional Java persistence engine that stores data structured in graphs rather than in tables". Neo4j is the most popular graph database.

Neo4j was developed by Neo Technology, Inc., based in the San Francisco Bay Area, US and Malmö, Sweden. Neo Technology board of directors consists of Rod Johnson (founder of the Spring Framework), Chris Barchak (Partner at Conor Venture Partners), Magnus Christerson (Vice President of Intentional Software Corp), Nikolaj Nyholm (Partner at Sunstone Capital), Guarav Tuli (Principal at Fidelity Growth Partners) and Johan Svensson (CTO of Neo Technology).

> [wikipedia.org/wiki/Neo4j](https://en.wikipedia.org/wiki/Neo4j)

![logo](http://neo4j.com/wp-content/themes/neo4jweb/assets/images/neo4j-logo-2015.png)

# How to use this image

## start a neo4j instance

    docker run --name neo4j [-p 1337:1337 -p 7474:7474] [-v /some/directory:/data] -d graanjonlo/neo4j[:tag]

This image includes `EXPOSE 1337` and `7474`, so standard container linking will make it automatically available to the linked containers. It also includes `VOLUME ["/data"]` so you can mount a data volume.

