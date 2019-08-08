DC/OS VPC
===========
This is an module to create a AWS VPC specially used for DC/OS

This modules creates a subnet for every .

EXAMPLE
-------
```hcl
module "dcos-vpc" {
  source  = "dcos-terraform/vpc/aws"
  version = "~> 0.2.0"

  cluster_name = "production"
  availability_zones = ["us-east-1b"]
  subnet_range = "172.16.0.0/16"
  # providers {
  # aws = "aws.my-provider"
  # }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zones | List of availability_zones to be used as the same format that are required by the platform/cloud providers. i.e ['RegionZone'] | list | `<list>` | no |
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| subnet\_range | Private IP space to be used in CIDR format | string | `"172.31.0.0/16"` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_main\_route\_table\_id | AWS main route table id |
| cidr\_block | Output the cidr_block used within this network |
| subnet\_ids | List of subnet IDs created in this network |
| subnets | List of subnet IDs created in this Network |
| vpc\_id | AWS VPC ID |

