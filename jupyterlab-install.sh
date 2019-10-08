#!/usr/bin/env bash

# Get the dns name for the public load balancer
export lb_dns_name=`aws elbv2 describe-load-balancers --name ext-wk-dcos-demo --output json | jq --raw-output .LoadBalancers[0].DNSName`
echo "###########################################"
echo "Found public load balancer: ${lb_dns_name}"
echo "jupyterlab will be available on: https://${lb_dns_name}/jupyterlab-notebook"
echo "The connection is not secure due to self-signed ssl certificate"
echo "###########################################"

# Create options json file
cat << EOF >jupyterlab-options.json
{
  "service": {
    "cpus": 1,
    "mem": 4096
  },
  "networking": {
    "external_access": {
      "enabled": true,
      "external_public_agent_hostname": "${lb_dns_name}"
    }
  },
  "spark": {
    "spark_driver_cores": 0.5,
    "spark_driver_memory": "1g",
    "spark_conf_executor_cores": "spark.executor.cores=1",
    "spark_conf_executor_memory": "spark.executor.memory=1g",
    "spark_conf_jars_packages": "spark.jars.packages=org.apache.spark:spark-streaming-kafka-0-10_2.11:2.4.1,org.apache.kafka:kafka_2.11:0.10.2.1,com.datastax.spark:spark-cassandra-connector_2.11:2.3.3,org.apache.spark:spark-sql_2.11:2.2.2,anguenot:pyspark-cassandra:0.11.0"
  }
}
EOF
# Install with options
dcos package install jupyterlab --options jupyterlab-options.json --yes
