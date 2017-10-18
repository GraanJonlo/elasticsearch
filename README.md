# What is Elasticsearch?

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents. Elasticsearch is developed in Java and is released as open source under the terms of the Apache License. Elasticsearch is the second most popular enterprise search engine.

> [wikipedia.org/wiki/Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch)

![logo](https://raw.githubusercontent.com/docker-library/docs/master/elasticsearch/logo.png)

# How to use this image

See the supporting docker-compose.yml for an example configuration.

If you get an error along the lines of

```
virtual memory areas vm.max_map_count [xxx] too low
```

try
```
sudo sysctl -w vm.max_map_count=262144
```
