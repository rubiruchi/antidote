#!/bin/sh -e
REPO=$1
REF=$2
DIR=$3
# Init Containers will re-run on Pod restart. Remove the directory's contents
# and reprovision when this happens.
if [ -d "$DIR" ]; then
    rm -rf $( find $DIR -mindepth 1 )
fi
git clone $REPO $DIR
cd $DIR
# git reset --hard $REF
git checkout $REF

chown -R antidote:antidote $DIR
