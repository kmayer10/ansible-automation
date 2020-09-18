provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "centos_server_master"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.medium"
    count = 25

    tags = {
        Name = "IBM-DEVOPS-KUL"
    }

    provisioner "local-exec" {
        command = "echo '[master] > master_public_ip.txt' && echo ${self.public_ip} >> master_public_ip.txt"
    }
	
	provisioner "remote-exec" {
        connection{
            type = "ssh"
            user = "root"
            password = "thinknyx@123"
            host = self.public_ip
        }
        inline = [
            "yum install -y git",
			"yum install -y epel-release",
			"yum install -y ansible",
			"git clone https://github.com/kmayer10/ibm-devops-advanced-4.git /root/ansible"
        ]
    }
	
	provisioner "file" {

        connection{
            type = "ssh"
            user = "root"
            password = "thinknyx@123"
            host = self.public_ip
        }

        source      = "ansible.cfg"
        destination = "/root/ansible/ansible.cfg"
    }
	
}

resource "aws_instance" "centos_server_node"{
    ami = "ami-030ff268bd7b4e8b5"
    instance_type = "t2.micro"
    count = 25

    tags = {
        Name = "IBM-DEVOPS-KUL"
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} >> node_public_ip.txt"
    }
}
