/*
  Public Subnet
*/
resource "aws_subnet" "public_sub"{
    vpc_id=aws_vpc.main.id
    cidr_block= var.pubic_subnet
    availability_zone ="us-east-2a"

    tags{
        Name="subnet-public"
    }
}

/*
  Public Subnet 2 (Load Balancer Demands it)
*/

resource "aws_subnet" "public_sub2"{
   vpc_id=aws_vpc.main.id
   cidr_block= var.public_subnet_failover
   availability_zone ="us-east-2b"

    tags{
        Name="subnet-public"
    }
}

/*
  Private Subnet
*/

resource "aws_subnet" "private_sub" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet
    availability_zone ="us-east-2a"

    tags {
        Name = "Private Subnet"
    }
}