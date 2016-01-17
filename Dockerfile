FROM debian:jessie
MAINTAINER Arnold Bechtoldt <mail@arnoldbechtoldt.com>

RUN mkdir -p /var/log/salt

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -qq && \
    apt-get install -yV -o DPkg::Options::=--force-confold \
        ssh \
        vim \
        wget

RUN wget --no-check-certificate -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" >> /etc/apt/sources.list

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -qq && \
    apt-get install -yV -o DPkg::Options::=--force-confold \
        salt-ssh

#RUN export DEBIAN_FRONTEND=noninteractive; \
#    apt-get update -qq && \
#    apt-get install -yV -o DPkg::Options::=--force-confold \
#        python-pip \
#        python-dev
#
#RUN pip install salt

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
