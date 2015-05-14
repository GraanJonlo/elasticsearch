#!/bin/bash

chown elasticsearch:elasticsearch /data
chmod 0755 /data

exec /sbin/setuser elasticsearch /elasticsearch/bin/elasticsearch

