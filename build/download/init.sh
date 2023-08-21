#!/usr/bin/env bash
DATA_DIR=$1

# Run checksum against tarball
export CHECKSUM=$(md5sum $DATA_DIR/data.tgz)

# Check target directory for pre-existence
if grep -q "$CHECKSUM" $DATA_DIR/checksum
then
    echo "Found matching checksum, skipping init"
    exit 0
else
    echo "Did not find checksum, assuming fresh PV"
fi

# Untar to target directory
tar xvf $DATA_DIR/data.tgz -C $DATA_DIR

# write checksum if successful
if [ $? -eq 0 ];
then
    echo "Successfully initialized $DATA_DIR directory, now writing checksum"
    echo $CHECKSUM > $DATA_DIR/checksum
fi
