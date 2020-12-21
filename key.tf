resource "aws_key_pair" "Ticket1" {
  key_name   = "${var.key_name}"
  public_key = "${file("~/.ssh/bob.pub")}"
}