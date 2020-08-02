#!/bin/bash
cd /opt

REPO="https://github.com/yamaoka-kitaguchi-lab/wireguard-peering"
WG_CONFIG="/etc/wireguard/wg0.conf"
WG_CONFIG_DRAFT="/tmp/wg0.conf.draft"
WORKDIR="/opt/wireguard-peering"

repository_is_updated=1
if [[ ! -e $WORKDIR ]]; then
    git clone $REPO $WORKDIR 2> /dev/null
    pushd $WORKDIR
else
    pushd $WORKDIR
    lastlastcommit=$(git rev-parse HEAD)
    git pull
    lastcommit=$(git rev-parse HEAD)
    [[ "$lastlastcommit"  == "$lastcommit" ]] && repository_is_updated=0
fi

if (( $repository_is_updated == 0 )); then
    echo "Repository has already been updated."
    exit 0
fi

awk '/\[Interface\]/,/## Peering Settings' < $WG_CONFIG > $WG_CONFIG_DRAFT
echo >> $WG_CONFIG_DRAFT
cat peers.conf >> $WG_CONFIG_DRAFT

rsync -av $WG_CONFIG_DRAFT $WG_CONFIG
systemctl restart wg-quick@wg0

