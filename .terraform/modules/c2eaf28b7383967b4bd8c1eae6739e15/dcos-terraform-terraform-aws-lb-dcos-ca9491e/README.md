AWS LB DC/OS
============
This module creates three load balancers for DC/OS.

External masters application load balancer
------------------------------------------
This load balancer keeps an redundant entry point to the masters

Internal masters network load balancer
--------------------------------------
this load balancer is used for internal communication to masters

External public agents network load balancer
--------------------------------------------
This load balancer keeps a single entry point to your public agents no matter how many you're running.

EXAMPLE
-------

```hcl
module "dcos-lbs" {
  source  = "dcos-terraform/lb-dcos/aws"
  version = "~> 0.2.0"

  cluster_name = "production"

  subnet_ids = ["subnet-12345678"]
  security_groups_masters = ["sg-12345678"]
  security_groups_masters_internal = ["sg-12345678"]
  security_groups_public_agents = ["sg-12345678"]
  master_instances = ["i-00123456789e960f8"]
  public_agent_instances = ["i-00123456789e960f8"]

  masters_acm_cert_arn = "arn:aws:acm:us-east-1:123456789123:certificate/ooc4NeiF-1234-5678-9abc-vei5Eeniipo4"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| disable\_masters | [MASTERS] Do not create load balancer and its resources | string | `"false"` | no |
| disable\_public\_agents | [PUBLIC AGENTS] Do not create load balancer and its resources | string | `"false"` | no |
| internal | This ELB is internal only | string | `"false"` | no |
| master\_instances | List of master instance IDs | list | n/a | yes |
| masters\_acm\_cert\_arn | ACM certifacte to be used for the masters load balancer | string | `""` | no |
| masters\_internal\_acm\_cert\_arn | ACM certifacte to be used for the internal masters load balancer | string | `""` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| num\_masters | Specify the amount of masters. For redundancy you should have at least 3 | string | n/a | yes |
| num\_public\_agents | Specify the amount of public agents. These agents will host marathon-lb and edgelb | string | n/a | yes |
| public\_agent\_instances | List of public agent instance IDs | list | n/a | yes |
| public\_agents\_acm\_cert\_arn | ACM certifacte to be used for the public agents load balancer | string | `""` | no |
| public\_agents\_additional\_listeners | Additional list of listeners for public agents. These listeners are an additon to the default listeners. | list | `<list>` | no |
| security\_groups\_masters | Security Group IDs to use for external masters load balancer | list | n/a | yes |
| security\_groups\_masters\_internal | Security Group IDs to use for internal communication to masters | list | n/a | yes |
| security\_groups\_public\_agents | Security Group IDs to use for external public agents load balancer | list | n/a | yes |
| subnet\_ids | List of subnet IDs created in this network | list | n/a | yes |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| masters\_dns\_name | DNS Name of the master load balancer |
| masters\_internal\_dns\_name | DNS Name of the master load balancer |
| public\_agents\_dns\_name | DNS Name of the public agent load balancer |

