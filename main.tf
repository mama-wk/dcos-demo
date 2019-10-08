provider "aws" {
  # Change your default region here
  region = "eu-central-1"
  #region = "us-east-2"

  # Uncomment and insert credential values from AWS
  # (only required if aws cli is not configured)
  #access_key = "<access key of the aws account>"
  #secret_key = "<secret key of the aws account>"
}

# Used to determine your public IP for forwarding rules
data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

module "dcos" {
  source  = "dcos-terraform/dcos/aws"
  version = "~> 0.2.0"

  providers = {
    aws = "aws"
  }

  cluster_name        = "wk-dcos-demo"
  ssh_public_key_file = "~/.ssh/id_rsa_aws_demo.pub"
  admin_ips           = ["${data.http.whatismyip.body}/32"]

  # Newer versions of Centos don't seem to work properly with
  # this version of DC/OS
  dcos_instance_os             = "centos_7.5"

  # Master t2.medium seems to have not enough memory, the mesos master just dies
  # every now and then during Cassandra installation
  masters_instance_type        = "t2.large"
  num_masters                  = 3

  # Private slaves require more memory for Cassandra
  private_agents_instance_type = "t3.large"
  num_private_agents           = 10

  # Public agents are not really used yet
  public_agents_instance_type  = "t3.medium"
  num_public_agents            = 1

  # The bootstrap server is only one instance and recommended t2.medium
  # seems to be ok
  bootstrap_instance_type      = "t2.medium"


  dcos_version = "1.13.3"

  # dcos_variant              = "ee"
  # dcos_license_key_contents = "${file("./license.txt")}"
  # Make sure to set your credentials if you do not want the default EE
  # dcos_superuser_username      = "superuser-name"
  # dcos_superuser_password_hash = "${file("./dcos_superuser_password_hash.sha512")}"
  dcos_variant = "open"

  with_replaceable_masters = true

  # Assign instance profiles so that masters can store zookeeper configs in s3
  # and private slaves can download the spark job .jar file.
  #masters_iam_instance_profile=""
  #private_agents_iam_instance_profile=""
  #public_agents_iam_instance_profile=""
}

output "masters-ips" {
  value = "${module.dcos.masters-ips}"
}

output "cluster-address" {
  value = "${module.dcos.masters-loadbalancer}"
}

output "public-agents-loadbalancer" {
  value = "${module.dcos.public-agents-loadbalancer}"
}
