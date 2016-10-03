FROM phusion/baseimage:0.9.19

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN \
  add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update && apt-get install -y \
  openjdk-8-jdk \
  wget

RUN rm -rf /var/lib/apt/lists/*

ENV ES_VERSION 2.4.1

RUN \
  cd /tmp && \
  wget -O elasticsearch.tar.gz https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch.tar.gz && \
  mv elasticsearch-$ES_VERSION /elasticsearch && \
  groupadd elasticsearch && \
  useradd -g elasticsearch elasticsearch && \
  rm -rf /tmp/*

RUN \
  cd /elasticsearch && \
  bin/plugin install mobz/elasticsearch-head && \
  bin/plugin install royrusso/elasticsearch-HQ

VOLUME ["/data"]
VOLUME ["/var/logs/elasticsearch"]

RUN mkdir -p /etc/service/elasticsearch
ADD elasticsearch.sh /etc/service/elasticsearch/run

ADD elasticsearch.toml /etc/confd/conf.d/elasticsearch.toml
ADD elasticsearch.yml.tmpl /etc/confd/templates/elasticsearch.yml.tmpl
ADD logging.yml /elasticsearch/config/logging.yml

EXPOSE 9200 9300-9400

CMD ["/sbin/my_init", "--quiet"]