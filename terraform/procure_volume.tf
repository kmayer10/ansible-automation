resource "aws_ebs_volume" "volume"{
    availability_zone = "us-east-1a"
    size = 10
    tags = {
        Name = "IBM-DEVOPS-KUL"
    }
}