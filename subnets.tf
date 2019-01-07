/*
  Public Subnet
*/
resource "aws_subnet" "public_sub"{
    vpc_id="${aws_vpc.main.id}"
    cidr_block="10.0.0.0/24"
    availability_zone ="us-east-2a"

    tags{
        Name="subnet-public"
    }
}
/*
  Public Subnet 2 (Load Balancer Demands it)
*/
resource "aws_subnet" "public_sub2"{
   vpc_id="${aws_vpc.main.id}"
   cidr_block="10.0.3.0/24"
   availability_zone ="us-east-2b"

    tags{
        Name="subnet-public"
    }
}

/*
  Private Subnet
*/

resource "aws_subnet" "private_sub" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone ="us-east-2a"

    tags {
        Name = "Private Subnet"
    }
}