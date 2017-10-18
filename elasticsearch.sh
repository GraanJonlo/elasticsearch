#!/bin/bash
/usr/local/bin/confd -onetime -backend env

mkdir -p /var/logs/elasticsearch
mkdir -p /elasticsearch/plugins
chown elasticsearch:elasticsearch /data
chown elasticsearch:elasticsearch /var/logs/elasticsearch
chown elasticsearch:elasticsearch /elasticsearch/plugins
chown elasticsearch:elasticsearch /elasticsearch/config
chmod 0755 /data
chmod 0755 /var/logs/elasticsearch
chmod 0755 /elasticsearch/plugins
chmod 0755 /elasticsearch/config
chmod -R +r /elasticsearch

exec /sbin/setuser elasticsearch /elasticsearch/bin/elasticsearch
