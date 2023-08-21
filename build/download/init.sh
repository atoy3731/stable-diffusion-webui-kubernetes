#!/bin/bash

DATA_DIR=$1

# Run checksum against tarball
export CHECKSUM=$(md5sum data.tgz)

# Check target directory for pre-existence
if grep -q "$CHECKSUM" $DATA_DIR/checksum
then
    echo "Found matching checksum, skipping init"
    exit 0
fi

# Untar to target directory
tar xvf data.tgz -C $DATA_DIR

# write checksum if successful
if [ -z $? ]
then
    echo "Successfully initialized $DATA_DIR directory, now writing checksum
    echo $CHECKSUM > $DATA_DIR/checksum
fi
