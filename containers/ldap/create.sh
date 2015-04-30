#!/bin/sh

DATADIR="/var/lib/ces/ldap"

if ! [ -d $DATADIR ]; then
	btrfs subvolume create $DATADIR
	if ! [ -d $DATADIR/data ]; then
		mkdir -p $DATADIR/data/config
		mkdir -p $DATADIR/data/db
		chown -R 102:102 $DATADIR/data
	fi
fi

docker rm -f ldap
docker create \
  --name ldap \
  -h ldap \
	-v $DATADIR/data/config:/etc/ceslap \
	-v $DATADIR/data/db:/var/lib/ldap \
	-v /etc/ces:/etc/ces \
	cesi/ldap