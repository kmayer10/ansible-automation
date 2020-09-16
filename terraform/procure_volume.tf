resource "aws_ebs_volume" "volume"{
    availability_zone = var.aws_az
    size = 10
    tags = {
        Name = var.tag_name
    }
}