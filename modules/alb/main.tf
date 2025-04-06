provider "aws" {
  region = var.aws_region
}

# Web Load Balancer Configuration
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

# Web Target Group Configuration
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

# Web Listener for Load Balancer
resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "Welcome to the Web Server"
    }
  }
}

# Attach Web Instances to Target Group
resource "aws_lb_target_group_attachment" "web_instance_attachment" {
  count              = length(aws_instance.web_instance)
  target_group_arn   = aws_lb_target_group.web_target_group.arn
  target_id          = aws_instance.web_instance[count.index].id
  port               = 80
}

# Web Security Group for Web Server (optional if not already defined)
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
