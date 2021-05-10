# Terraform setup on AWS 

This terraform build consists of :

     a)2 Public Subnets (1 extra is need because the loablancer needs another subnet to run in case something happens)
     b)Nat Instance that will allow instances in private subnet to reach out the network
     c)Private instances can be reached out only from the public subnet
     d)App Load Balancer that will route request to sever A and to server B based on the group attachments
     e)Bastion host so you can SSh to the private server
     f)SSh public key gets delivered 


## Getting started

First clone the Repo and run terraform init within

### Credentials.tf

Initially we need to set the environmental variables for the aws credentials:
```bash
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
```
Replace the default  variables from variables.tf

```hcl
variable "cidr" {
  description = "CIDR for the whole VPC"
  default = ""
}

variable "pubic_subnet" {
  description = "cidr block for the public subnet"
  default = ""
}

variable "public_subnet_failover" {
  description = "cidr block in case the public subnet fails"
  default = ""
}

variable "private_subnet" {
  description = "cidr block for the private subnet"
  default = "10.0.2.0/24"
}
```





 




