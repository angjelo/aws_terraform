/*
 Instances
*/

/*
 Bastion Server to configure bastion
*/

resource "aws_instance" "bastion" {
    ami = "ami-0cd3dfa4e37921605"
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        aws_security_group.web.id]
    key_name= aws_key_pair.deployer.key_name
    subnet_id = aws_subnet.public_sub.id
    associate_public_ip_address = true
    source_dest_check = false
}

resource "aws_eip" "bastian" {
    instance = aws_instance.bastion.id
    vpc = true
}

/*
  Contact server (A)
*/
resource "aws_instance" "a" {
    ami = "ami-446e5b21"
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        aws_security_group.web.id]
    key_name= aws_key_pair.deployer.key_name
    subnet_id = aws_subnet.private_sub.id
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Web Server A"
    }
}


/*
  About server(B)
*/

resource "aws_instance" "b" {
    ami = "ami-446e5b21"
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        aws_security_group.web.id]
    key_name= aws_key_pair.deployer.key_name
    subnet_id = aws_subnet.private_sub.id
    associate_public_ip_address = false
    source_dest_check = false

    tags {
        Name = "Web Server B"
    }
}


/*
  Nat instance
*/

resource "aws_instance" "nat" {
    ami = "ami-299faa4c" # this is a special ami preconfigured to do NAT
 
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        aws_security_group.nat.id]
    subnet_id = aws_subnet.public_sub.id
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }
}

resource "aws_eip" "nat" {
    instance = aws_instance.nat.id
    vpc = true
}




