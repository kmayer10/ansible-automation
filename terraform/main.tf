resource "aws_instance" "centos_server"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    #count = 1

    tags = {
        Name = "IBM-DEVOPS-KUL"
    }

    security_groups = [
        aws_security_group.centos_server_sg_group.name
    ]
}