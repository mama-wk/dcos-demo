variable "cluster_name" {
  description = "Name of the DC/OS cluster"
  default     = "dcos-example"
}

variable "ssh_public_key_file" {
  description = "Path to an SSH public key to be used with the instances. Make sure you added this key to your ssh-agent"
}

variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}

module "dcos" {
  source  = "dcos-terraform/dcos/aws"
  version = "~> 0.0.19"

  cluster_name        = "${var.cluster_name}"
  ssh_public_key_file = "${var.ssh_public_key_file}"
  tags                = "${var.tags}"

  num_masters        = "1"
  num_private_agents = "2"
  num_public_agents  = "1"

  dcos_variant = "open"
}

output "cluster-address" {
  value = "${module.dcos.masters-loadbalancer}"
}
