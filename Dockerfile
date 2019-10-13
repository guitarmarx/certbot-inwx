FROM python:3.7-slim

LABEL maintainer="meteorIT GbR Marcus Kastner"
VOLUME /etc/letsencrypt

ENV INWX_URL=https://api.domrobot.com/xmlrpc/ \
    INWX_USERNAME=your_username \
    INWX_PASSWORD=your_password \
    INWX_SHARED_SECRET="your_shared_secret optional"  \
    CERTBOT_INFO_MAIL=info@localhost.local \
    DOCKERIZE_VERSION=v0.6.1 \
    DOMAINS="test.de,*.test.de"

COPY templates/ /srv
COPY entrypoint.sh /srv
COPY scripts/ /srv

RUN apt update \
    && apt install --no-install-recommends -y  certbot curl tar \
    && pip install certbot-dns-inwx

# download dockerize
RUN curl -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz --output /tmp/dockerize.tar.gz  \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm /tmp/dockerize.tar.gz

RUN chmod +x /srv/entrypoint.sh

ENTRYPOINT /srv/entrypoint.sh