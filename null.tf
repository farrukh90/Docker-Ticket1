resource "null_resource" "ticket1" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/bob.rsa")}"
      host        = "${aws_instance.Test.public_ip}"
    }
    source      = "userdata.sh"
    destination = "/tmp/userdata.sh"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/bob.rsa")}"
      host        = "${aws_instance.Test.public_ip}"
    }
    inline = [
      "sudo chmod +x /tmp/userdata.sh",
      "sudo /tmp/userdata.sh args",
    ]
  }
}