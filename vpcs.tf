resource "aws_vpc" "main"{
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
   

    tags{
        Nanme="main"
        Location= "US OHIO EAST 2"
    }
}
