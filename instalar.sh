#!/bin/sh
# Instala o actualiza la ruleta en el VPS (Ubuntu). Uso: sh instalar.sh
set -e
apt-get update -y
apt-get install -y nginx git
if [ -d /var/www/casino/.git ]; then git -C /var/www/casino pull --ff-only; else git clone --depth 1 https://github.com/apereiranube/casino-web.git /var/www/casino; fi
# Si ya tiene el certificado (lo agregó certbot), no se pisa la configuración.
grep -q 'managed by Certbot' /etc/nginx/sites-available/casino 2>/dev/null || cp /var/www/casino/nginx-casino.conf /etc/nginx/sites-available/casino
ln -sf /etc/nginx/sites-available/casino /etc/nginx/sites-enabled/casino
rm -f /etc/nginx/sites-enabled/default
nginx -t
systemctl enable --now nginx
systemctl reload nginx
if command -v ufw >/dev/null && ufw status | grep -q " active"; then ufw allow 80/tcp; fi
if command -v ufw >/dev/null && ufw status | grep -q " active"; then ufw allow 443/tcp; fi
echo "LISTO"
