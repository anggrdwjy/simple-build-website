#!/bin/bash
sudo apt install curl -y
echo -n "Zone Code: ";
read zonecode
echo -n "Email Cloudflared: ";
read emailcloudflared
echo -n "Auth-Key Cloudflared: ";
read authkey
echo -n "Domain: ";
read domain
curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$zonecode/dns_records" \
     -H "X-Auth-Email: $emailcloudflared" \
     -H "X-Auth-Key: $autheky" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"$domain","content":"ip","ttl":120,"priority":10,"proxied":true}' > /dev/null
