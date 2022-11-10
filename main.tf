resource "aws_vpc" "requesting_vpc" {
    cidr_block = "10.100.0.0/16"
}

resource "aws_vpc" "accepting_vpc" {
    cidr_block = "10.200.0.0/16"
}

resource "aws_subnet" "requesting-subnet-00" {
    vpc_id = "aws_vpc.requesting_vpc.id"
    cidr_block = "10.100.0.0/16"
    
}

resource "aws_subnet" "accepting-subnet-00" {
    vpc_id = "aws_vpc.accepting_vpc.id"
    cidr_block = "10.200.0.0/16"
    
}