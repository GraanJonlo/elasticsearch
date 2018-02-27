FROM phusion/baseimage:0.10.0

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ADD https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN \
  add-apt-repository ppa:openjdk-r/ppa && \
  apt-get update && apt-get install -y \
  openjdk-8-jdk \
  wget

RUN rm -rf /var/lib/apt/lists/*

ENV ES_VERSION 6.2.1

RUN \
  cd /tmp && \
  wget -O elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch.tar.gz && \
  mv elasticsearch-$ES_VERSION /elasticsearch && \
  groupadd elasticsearch && \
  useradd -g elasticsearch elasticsearch && \
  rm -rf /tmp/*

VOLUME ["/data"]
VOLUME ["/var/logs/elasticsearch"]

RUN mkdir -p /etc/service/elasticsearch
ADD elasticsearch.sh /etc/service/elasticsearch/run

ADD elasticsearch.toml /etc/confd/conf.d/elasticsearch.toml
ADD elasticsearch.yml.tmpl /etc/confd/templates/elasticsearch.yml.tmpl

ADD jvm.toml /etc/confd/conf.d/jvm.options.toml
ADD jvm.options.tmpl /etc/confd/templates/jvm.options.tmpl

ADD log4j2.properties /elasticsearch/config/log4j2.properties

EXPOSE 9200 9300-9400

CMD ["/sbin/my_init", "--quiet"]

