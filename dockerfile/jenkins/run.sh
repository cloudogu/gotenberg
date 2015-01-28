#!/bin/bash

DATADIR="/var/lib/ces/jenkins"
if [ ! -d "$DATADIR" ]; then
  btrfs subvolume create "$DATADIR"
  mkdir "$DATADIR/data"
  chown -R 1000:1000 "$DATADIR"
  chmod -R 755 "$DATADIR"
fi

docker rm jenkins
docker run -d \
  --name jenkins \
  -h jenkins \
  -P \
  -v /etc/ces:/etc/ces \
  -v "$DATADIR/data":/var/lib/jenkins \
  cesi/jenkins