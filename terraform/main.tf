#Configuring the Provider to procure resources

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "centos_server"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    #count = 1

    tags = {
        Name = "IBM-DEVOPS-KUL"
    }

    security_groups = [
        aws_security_group.centos_server_sg_group.name
    ]
}

resource "aws_security_group" "centos_server_sg_group"{
    name = "kul-sg"
    description = "This is demo SG group for IBM DevOps Session"

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "centos_server_public_ip" {
    value = aws_instance.centos_server.public_ip
}

output "centos_server_private_ip" {
    value = aws_instance.centos_server.private_ip
}

output "centos_server_id" {
    value = aws_instance.centos_server.id
}