resource "aws_launch_configuration" "hisab-web" {
  name_prefix                 = "hisab-web-"
  image_id                    = "ami-08569b978cc4dfa10"
  instance_type               = "t2.micro"
  key_name                    = "test"
  security_groups             = ["${aws_security_group.hisab-ec2-security-group.id}"]
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  lifecycle {
    create_before_destroy = true
  }
}