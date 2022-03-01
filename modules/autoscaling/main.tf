locals {
  customer_name = "mClouds-${var.env}"
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "aws_security_group" "securitygroup1" {
  name = "mcloudsecurityGroup"
  description = "DummySecurityGroup"
  vpc_id = var.vpc_id1
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  tags = {
    "Name" = "mcloudsecurityGroup"
  }
}

resource "aws_launch_configuration" "mclouds_as_conf" {
  name_prefix   = "terraform-mclouds-asconf"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "sachin-nclouds-new"
  security_groups = [aws_security_group.securitygroup1.id]

  lifecycle {
    create_before_destroy = true
  }
  
}

resource "aws_autoscaling_group" "bar" {
  name                      = "terraform-mclouds-asg"
  launch_configuration      = aws_launch_configuration.mclouds_as_conf.name
  max_size                  = 5
  min_size                  = 2
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [var.subnet1_id, var.subnet2_id]
}
