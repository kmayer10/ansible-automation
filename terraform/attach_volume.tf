resource "aws_volume_attachment" "attach_volume" {
    device_name = "/dev/xvdb"
    volume_id = aws_ebs_volume.volume.id
    instance_id = aws_instance.centos_server.id

    provisioner "remote-exec" {
        connection{
            type = "ssh"
            user = "root"
            password = "thinknyx@123"
            host = aws_instance.centos_server.public_ip
        }
        inline = [
            "df -h",
            "mkfs -t ext4 /dev/xvdb",
            "mkdir /opt/app",
            "mount /dev/xvdb /opt/app",
            "df -h"
        ]
    }

}