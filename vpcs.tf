resource "aws_vpc" "main"{
    cidr_block = var.cidr
    enable_dns_hostnames = true

    tags{
        Nanme="main"
        Location= "US OHIO EAST 2"
    }
}
