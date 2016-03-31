FROM phusion/baseimage:0.9.18

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

RUN \
  add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update && apt-get upgrade -y && apt-get install -y \
  openjdk-8-jdk \
  wget

ENV ES_VERSION 2.2.2

RUN \
  cd /tmp && \
  wget -O elasticsearch.tar.gz https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch.tar.gz && \
  mv elasticsearch-$ES_VERSION /elasticsearch && \
  groupadd elasticsearch && \
  useradd -g elasticsearch elasticsearch && \
  rm -rf /tmp/*

VOLUME ["/data"]
VOLUME ["/elasticsearch/logs"]

RUN mkdir -p /etc/service/elasticsearch
ADD elasticsearch.sh /etc/service/elasticsearch/run
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ADD logging.yml /elasticsearch/config/logging.yml

EXPOSE 9200
EXPOSE 9300

CMD ["/sbin/my_init", "--quiet"]

