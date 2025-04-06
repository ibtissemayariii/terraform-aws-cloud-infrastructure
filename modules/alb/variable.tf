# Launch Configuration (you can replace this with aws_launch_template if necessary)
resource "aws_launch_configuration" "web_launch_config" {
  name_prefix   = "web-launch-config"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.id]
  key_name      = var.key_name

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.public_subnet_ids
  launch_configuration = aws_launch_configuration.web_launch_config.id
  target_group_arns    = [aws_lb_target_group.web_target_group.arn]

  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  tags = [
    {
      key                 = "Name"
      value               = "web-server"
      propagate_at_launch = true
    }
  ]
}

# Load Balancer Configuration (should be correct now)
resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"  # For HTTP/HTTPS traffic
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "web-lb"
  }
}

# Target Group for the Load Balancer
resource "aws_lb_target_group" "web_target_group" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol = "HTTP"
    port     = "80"
    path     = "/"
  }

  tags = {
    Name = "web-target-group"
  }
}

# Listener
