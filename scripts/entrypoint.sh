# config inwx
dockerize  -template /srv/templates/inwx.cfg.template:/etc/letsencrypt/inwx.cfg
chmod 0600 /etc/letsencrypt/inwx.cfg

#generate domain string
domains=`python /srv/scripts/generateDomainString.py $DOMAINS`
echo "Domains: $domains"

#request certificates
certbot certonly --email $CERTBOT_INFO_MAIL  --agree-tos  --non-interactive -a certbot-dns-inwx:dns-inwx -d  $domains


if [ $? -eq 0 ]; then
    rm /etc/letsencrypt/live/README
    cp -L /etc/letsencrypt/live/*/* /srv/certs