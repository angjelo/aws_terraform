# Terraform setup on AWS 

This terraform build consists of :

     a)2 Public Subnets (1 extra is need because the loablancer needs another subnet to run in case something happens)
     b)Nat Instance that will allow instances in private subnet to reach out the network
     c)Private instances can be reached out only from the public subnet
     d)App Load Balancer that will route request to sever A and to server B based on the group attachments
     e)Bastion Server so you can SSh to the private server
     f)SSh public key gets delivered 


## Getting started

First clone the Repo and run terraform init within

### 1)Credentials.tf

You should edit the following:
```
provider aws{
  -> access_key=""
  -> secret_key=""
  -> region=""
}

resource "aws_key_pair" "deployer"{
    -> key_name=""
    -> public_key=""
}
```
### 2)vpcs.tf

Here you just edit the cidr_block
```
resource "aws_vpc" "main"{
        .
    -> cidr_block = "10.0.0.0/16" (here you setup you cidr_block)
        .
}
```

### 3)subnets.tf

For public_sub,public_sub2,private_sub you edit the same fields: 
```
resource "aws_subnet" ""{
         .
    -> cidr_block="10.0.0.0/24"
    -> availability_zone ="us-east-2a" (!Important)
         .
}

```
### 4)securitygroups.tf

```
resource "aws_security_group" "nat" {
          .
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
      ->cidr_blocks = ["10.0.2.0/24"] (Here enter your private subnet)
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
      ->cidr_blocks = ["10.0.2.0/24"] (Here enter your private subnet)
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
      ->cidr_blocks = ["10.0.0.0/24"] (Here enter your main vpc block)
    }
         .
}
```

### 6) Change AMI based on region navigate to instances.cf.

### 6)How to run

Execute on you terminal:
```
terraform apply
```
### 9) Copy files to bastion
```
scp /path/to/file username@a:/path/to/destination
```

### 10)Copy files by using scp from bastion

```
scp username@b:/path/to/file /path/to/destination
```
### SSH to private Subnet Instance
We will need to use SSH-agent to do that. We do not want to store the private key into the bastion server for security purposes.
We will cary the private key into memory and then ssh from the bastion server to the private instance.
```
ssh-add -K myPrivateKey
ssh –A user@<bastion-IP-address or DNS-entry>
```
Then you just ssh to the private instance
```
ssh ec2-user@ipaddress
```

 




