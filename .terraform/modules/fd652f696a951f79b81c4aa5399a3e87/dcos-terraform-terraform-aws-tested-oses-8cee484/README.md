AWS Tested OSes
============
This module returns for an given OS the AMI aswell as its default user

EXAMPLE
-------
```hcl
module "dcos-tested-oses" {
  source  = "terraform-dcos/tested-oses/aws"
  version = "~> 0.2.0"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_ami | AMI that will be used for the instances instead of the Mesosphere chosen default images. Custom AMIs must fulfill the Mesosphere DC/OS system-requirements: See https://docs.mesosphere.com/1.12/installing/production/system-requirements/ | map | `<map>` | no |
| aws\_default\_os\_user | Map OS name to default login user (e.g. centos -> centos, coreos -> coreos) | map | `<map>` | no |
| os | Operating system to use | string | `"centos_7.6"` | no |
| provider | Provider to use | string | `"aws"` | no |
| region | region | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_ami | AMI that will be used for the instances instead of the Mesosphere chosen default images. Custom AMIs must fulfill the Mesosphere DC/OS system-requirements: See https://docs.mesosphere.com/1.12/installing/production/system-requirements/ |
| user | User |

