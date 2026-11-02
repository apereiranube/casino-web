#!/bin/sh
# Pone el dominio y el certificado HTTPS (Let's Encrypt, gratis y con renovación automática).
# Uso: sh https.sh   (antes, el DNS del dominio tiene que apuntar a este servidor)
set -e
DOM=777play.io
sed -i "s/server_name _;/server_name $DOM www.$DOM;/" /etc/nginx/sites-available/casino
nginx -t && systemctl reload nginx
apt-get install -y certbot python3-certbot-nginx
certbot --nginx -d $DOM -d www.$DOM --non-interactive --agree-tos --register-unsafely-without-email --redirect
echo "LISTO: abri https://$DOM"
