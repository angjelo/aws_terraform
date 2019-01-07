/*
 Route Configuration for public sub2
*/

resource "aws_route_table" "public_sub2" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet 2"
    }
}

resource "aws_route_table_association" "public_sub2" {
    subnet_id = "${aws_subnet.public_sub2.id}"
    route_table_id = "${aws_route_table.public_sub2.id}"
}



resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.main.id}"
}




/*
  Route Associtation for public subnet1
*/
resource "aws_route_table" "public_sub" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}


resource "aws_route_table_association" "public_sub" {
    subnet_id = "${aws_subnet.public_sub.id}"
    route_table_id = "${aws_route_table.public_sub.id}"
}


/*
  Router Associtation for private subnet 
*/

resource "aws_route_table" "private_sub" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "private_sub" {
    subnet_id = "${aws_subnet.private_sub.id}"
    route_table_id = "${aws_route_table.private_sub.id}"
}
