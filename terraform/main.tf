#Configuring the Provider to procure resources

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "centos_server"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    count = 1

    tags = {
        Name = "IBM-DEVOPS-KUL"
    }
}