AWS DC/OS Private Agent Instances
============
This module creates typical private agent instances

EXAMPLE
-------

```hcl
module "dcos-private-agent-instances" {
  source  = "dcos-terraform/private-agents/aws"
  version = "~> 0.2.0"

  cluster_name = "production"
  aws_subnet_ids = ["subnet-12345678"]
  aws_security_group_ids = ["sg-12345678"]"
  aws_key_name = "my-ssh-key"

  num_private_agents = "2"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_key\_name | Specify the aws ssh key to use. We assume its already loaded in your SSH agent. Set ssh_public_key_file to empty string | string | n/a | yes |
| aws\_security\_group\_ids | Firewall IDs to use for these instances | list | n/a | yes |
| aws\_subnet\_ids | Subnets to spawn the instances in. The module tries to distribute the instances | list | n/a | yes |
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| aws\_ami | AMI that will be used for the instances instead of the Mesosphere chosen default images. Custom AMIs must fulfill the Mesosphere DC/OS system-requirements: See https://docs.mesosphere.com/1.12/installing/production/system-requirements/ | string | `""` | no |
| aws\_associate\_public\_ip\_address | Associate a public IP address with the instances | string | `"true"` | no |
| aws\_extra\_volumes | Extra volumes for each instance | list | `<list>` | no |
| aws\_iam\_instance\_profile | Instance profile to be used for these instances | string | `""` | no |
| aws\_instance\_type | Instance type | string | `"t2.medium"` | no |
| aws\_root\_volume\_size | Root volume size in GB | string | `"120"` | no |
| aws\_root\_volume\_type | Root volume type | string | `"standard"` | no |
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. | string | `"centos_7.4"` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster_name | string | `"%[3]s-privateagent%[1]d-%[2]s"` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| num\_private\_agents | Specify the amount of private agents. These agents will provide your main resources | string | `"1"` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |
| user\_data | User data to be used on these instances (cloud-init) | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| instances | List of instance IDs |
| os\_user | The OS user to be used |
| private\_ips | List of private ip addresses created by this module |
| public\_ips | List of public ip addresses created by this module |

