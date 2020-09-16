resource "aws_instance" "centos_server"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    availability_zone = var.aws_az
    #count = 1

    tags = {
        Name = var.tag_name
    }

    security_groups = [
        aws_security_group.centos_server_sg_group.name
    ]
}