#! /bin/bash
set -e

cd "$(git rev-parse --show-toplevel)"

# TODO: parse LTS and snapshot versions from stack.yaml
LTS=11.16
SNAPSHOT=tvision-11.16-55.yaml
if [ ! -f $SNAPSHOT ]; then
    aws s3 cp s3://tvision-artifacts/stack/snapshots/$LTS/$SNAPSHOT $SNAPSHOT
fi

build-scripts/make.sh $@
