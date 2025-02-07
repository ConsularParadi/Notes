---
tags:
  - cs/devops
---
>[!summary]
>Terraform is a IAC (Infrasture as Code) provisioning solution used to allocate resources and spin up virtual machines.
>- It is platform agnostic.

**Providers**: 
Plugins to connect to different cloud providers and other services.
- Complete list available at [terraform providers](https://registry.terraform.io/browse/providers?product_intent=terraform).

**Resources**:
To instantiate a service in the cloud.

>[!tip]
>HCL is declarative (order of resources $\ne$ order of instantiation)

**Output**:
To show resource related information on terminal whenever terraform [[Terraform#^bf9959|apply]] or [[Terraform#^88eca6|refresh]] is used.

**Variables**
To store information as variables which can be reused or has to be taken as input from user.

Ways to get input variables:
1. Terraform asks you to input vars whenever you apply or destroy
2. Provide values while running the command using [[Terraform#^9cd2a3|-var]] command
3. Provide one/many terraform variable files using [[Terraform#^9fa85a|-var-file]] command

> [!tip]
> ==terraform.tfvars== is the default file for storing terraform variables

### Docs

##### CLI Commands
- `terraform init`: installs required plugins in the project.
- `terraform plan`: dry run to see changes in infrastructure
- `terraform apply`: deploy changes ^bf9959
	- `--auto-approve`: does not require user to input "yes".
	- `-target`: to deploy only one resource
	- `-var`: to give values to variables while running the command ^9cd2a3
	- `-var-file`: to point terraform to a file storing variables ^9fa85a
- `terraform destroy`: destroys deployed infrastructure
	- Another way is to comment out the resource
	- `-target <resource>`: to destroy only one resource

> [!warning]
> These commands apply to all resources described in the ==.tf file==
> 

- `terraform state`: used for advanced state management
	-  `list`: lists all deployed resources
	- `show <resource>`: shows state information about a resource
- `terraform refresh`: refresh state of deployed resources (show terraform apply's output again) without applying changes in the file. ^88eca6
##### Examples

- Provider

```hcl title:"Example provider: AWS"
provider "aws" {
	region = "ap-south-1"
}
```

- Resource

```hcl title:"Example Resource: AWS EC2"
#resource "<provider>_<resource_type>" "<name>" {
#config_options ...
#key = "value"
#}

resource "aws_instance" "firstInstance" {
ami = "ami-0ad21ae1d0696ad58" #os-iso
instance_type = "t2.micro"
tags = {
Name = "<any-tag-name>"
}
}
```

- Output
```hcl title:"Example Output"
#output <out_name> {
#value = <resource>
#}

output "server_public_ip" { 
value = aws_eip.web_server_eip.public_ip
}
```

- Variable
```hcl title:"Example Variable"
#variable <var_name> {
#default = <default_value>
#description = <description_for_var>
#type = <type_of_var>
}

variable "ubuntu_ami" {
default = "ami-0ad21ae1d0696ad58"
description = "value of ubuntu ami"
type = string
}
```
##### Folder Structure
- <u>.terraform</u> -> stores plugins initialized during [[Terraform#Docs#CLI Commands|init]].
- <u>terraform.tfstate</u> -> stores current state of config.
- <u>*.tfvars</u> -> To store values for variables declared in `main.tf` as `var_name_in_main.tf_file = value` 

> [!references]
> [FCC crash course](https://youtu.be/SLB_c_ayRMo)



