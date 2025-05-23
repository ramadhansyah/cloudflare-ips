#!/bin/bash
TMP_FILE="/tmp/cloudflare-ips.conf"

echo "# Cloudflare IPv4" > $TMP_FILE
curl -s https://www.cloudflare.com/ips-v4 | awk '{print "allow "$0";"}' >> $TMP_FILE
echo "" >> $TMP_FILE

echo "# Cloudflare IPv6" >> $TMP_FILE
curl -s https://www.cloudflare.com/ips-v6 | awk '{print "allow "$0";"}' >> $TMP_FILE

echo "" >> $TMP_FILE
echo "deny all;" >> $TMP_FILE

mv $TMP_FILE /etc/nginx/cloudflare-ips.conf
nginx -t && systemctl reload nginx