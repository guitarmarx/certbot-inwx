# Postfix Docker Image for Relay Domains

The image uses certbot to generate new certificates (including wildcard certificates) over the inwx api.
**Requirement:** INWX Account + Domain/DNS managed by inwx

Generated keys/certificates are locatated at /srv/keys inside the container

## Build image
```sh
git clone https://github.com/guitarmarx/certbot-inwx.git
cd certbot-inwx
docker build -t <imagename:version> .
```

## Usage

```sh
docker run -d  \
    -e INWX_USERNAME=<inwx username> \
    -e INWX_PASSWORD=<inwx password> \
    -e CERTBOT_INFO_MAIL=<cerbot info mail> \
    -e DOMAINS="<domain>,<*.domain>" \
    -v <your cert path>:/srv/keys \
    <imagename>:<version>
```


# Configuration

Parameter | Function| Default Value|
---|---|---|
DOMAINS | (required) Comma separated domain list |
INWX_URL | INWX Api URL | https://api.domrobot.com/xmlrpc/
INWX_USERNAME | (required) INWX Username |
INWX_PASSWORD | (required) INWX Password |
INWX_SHARED_SECRET | (optional) INWX shared secret |
CERTBOT_INFO_MAIL | (optional) mail for certbot notification |