#!/usr/bin/env bash
. environment_vars.sh
dcos cassandra plan start restore-s3 \
    -p SNAPSHOT_NAME=tweets_20190911 \
    -p "CASSANDRA_KEYSPACES=dcos" \
    -p AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -p AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -p AWS_REGION=$AWS_REGION \
    -p S3_BUCKET_NAME=wk-dcos-demo-backup
