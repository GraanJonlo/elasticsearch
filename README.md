# What is Elasticsearch?

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents. Elasticsearch is developed in Java and is released as open source under the terms of the Apache License. Elasticsearch is the second most popular enterprise search engine.

> [wikipedia.org/wiki/Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/elasticsearch/logo.png)

# How to use this image

## start an elasticsearch instance

    docker run --name elasticsearch [-p 9200:9200 -p 9300:9300] [-v /some/directory:/data] -d graanjonlo/elasticsearch[:tag]

This image includes `EXPOSE 9200` and `9300`, so standard container linking will make it automatically available to the linked containers. It also includes `VOLUME ["/data"]` so you can mount a data volume.

