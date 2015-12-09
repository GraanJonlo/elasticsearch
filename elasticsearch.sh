#!/bin/bash
mkdir -p /elasticsearch/logs
mkdir -p /elasticsearch/plugins
chown elasticsearch:elasticsearch /data
chown elasticsearch:elasticsearch /elasticsearch/logs
chown elasticsearch:elasticsearch /elasticsearch/plugins
chown elasticsearch:elasticsearch /elasticsearch/config
chmod 0755 /data
chmod 0755 /elasticsearch/logs
chmod 0755 /elasticsearch/plugins
chmod 0755 /elasticsearch/config

exec /sbin/setuser elasticsearch /elasticsearch/bin/elasticsearch

