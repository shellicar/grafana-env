FROM debian:jessie

ENV PACKAGES git curl ca-certificates vim

RUN apt-get update \
&&  apt-get -y --no-install-recommends install ${PACKAGES} \
&&  rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN curl -o node.tar.gz https://nodejs.org/download/release/v6.10.0/node-v6.10.0-linux-x64.tar.gz \
&& mkdir -p /usr/lib/nodejs \
&& tar xvzf node.tar.gz -C /usr/lib/nodejs \
&& mv /usr/lib/nodejs/node-v6.10.0-linux-x64 /usr/lib/nodejs/node-v6.10.0

ENV NODEJS_HOME=/usr/lib/nodejs/node-v6.10.0
ENV PATH=$NODEJS_HOME/bin:$PATH

RUN npm install -g yarn

WORKDIR /root                                                                                                     
