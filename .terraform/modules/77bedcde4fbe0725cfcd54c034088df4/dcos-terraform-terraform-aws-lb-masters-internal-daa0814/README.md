AWS LB Internal
============
This module create a network load balancer for cluster internal access to masters

EXAMPLE
-------

```hcl
module "dcos-lb-masters-internal" {
  source  = "terraform-dcos/lb-masters-internal/aws"
  version = "~> 0.2.0"

  cluster_name = "production"

  subnet_ids = ["subnet-12345678"]
  security_groups = ["sg-12345678"]

  instances = ["i-00123456789e960f8"]
  num_instances = 1

  https_acm_cert_arn = "arn:aws:acm:us-east-1:123456789123:certificate/ooc4NeiF-1234-5678-9abc-vei5Eeniipo4"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| disable | Do not create load balancer and its resources | string | `"false"` | no |
| https\_acm\_cert\_arn | ACM certifacte to be used. | string | `""` | no |
| instances | List of instance IDs | list | n/a | yes |
| name\_prefix | Name Prefix | string | `""` | no |
| num\_instances | How many instances should be created | string | n/a | yes |
| security\_groups | Security Group IDs to use | list | `<list>` | no |
| subnet\_ids | List of subnet IDs created in this network | list | n/a | yes |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns\_name | DNS Name of the master load balancer |

