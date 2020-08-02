#!/bin/bash

REPO="https://github.com/yamaoka-kitaguchi-lab/publickeys"
USERHOME="/home/all"
LOCALDIR="publickeys"

cd $USERHOME

git clone $REPO $LOCALDIR 2> /dev/null
if (( $? > 0 )); then
    pushd $LOCALDIR
    git pull
    popd
fi

mkdir -p $USERHOME/.ssh
rsync -av $LOCALDIR/authorized_keys $USERHOME/.ssh/authorized_keys
chown -R $USER $USERHOME/.ssh
chmod -R 700 $USERHOME/.ssh

