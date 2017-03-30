FROM debian:latest

RUN apt-get -qq -y update && \
    apt-get -qq -y --no-install-recommends install \
            ca-certificates \
            openssl \
            shibboleth-sp2-utils \
            supervisor 1>/dev/null && \
    /usr/sbin/shib-keygen -f 1>/dev/null && \
    mkdir -p /var/log/shibboleth && \
    rm -r /var/lib/apt/lists/* && \
    mv /etc/shibboleth /etc/shibboleth-orig

COPY etc/supervisor/conf.d/shibd-supervisor.conf /etc/supervisor/conf.d/shibd-supervisor.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /etc/shibboleth

VOLUME ["/etc/shibboleth"]

EXPOSE 8118/TCP 9119/TCP

CMD ["docker-entrypoint.sh"]

