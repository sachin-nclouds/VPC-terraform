
resource "aws_lb" "mcloud-lb" {
  name               = "mclouds-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [var.subnet1_id, var.subnet2_id]
  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}