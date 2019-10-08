#!/usr/bin/env bash
dcos spark run -v --submit-args='--class SparkJob --conf spark.mesos.containerizer=mesos https://test-wk-bucket.s3.eu-central-1.amazonaws.com/spark-twitter-job-assembly-0.3.jar tweets node-0-server.cassandra.autoip.dcos.thisdcos.directory 9042 broker.kafka.l4lb.thisdcos.directory:9092'
