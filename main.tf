resource "aws_lb" "app_alb" {
  name             	  = var.app_alb_name
  internal           	  = true
#  load_balancer_type 	  = "application" 
#  vpc_id                  = var.vpc_id
  security_groups      	  = var.security_groups
  subnets                 = var.subnets


  #enable_deletion_protection = true

  tags = merge(
    var.tags,
    var.app_alb_tags
  )
}



resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  # This will add one listener on port no 80 and one default rule
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This is the fixed response from APP ALB"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "main" {
  name     = var.target_group_name
  protocol = "HTTP"
  target_type = "ip"
  port = 80
  vpc_id   = var.vpc_id
  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 15
    path = "/health"
    port = 80
    protocol = "HTTP"
    timeout = 6
    matcher = "200-399"
    unhealthy_threshold = 3
  }
}

