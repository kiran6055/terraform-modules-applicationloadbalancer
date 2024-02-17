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
