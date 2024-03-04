output "app_alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "app_alb_load_balancer_arn" {
  value = aws_lb.alb.arn
}

output "app_alb_zone_id" {
  value = aws_lb.alb.zone_id
}

output "app_alb_arn" {
  value = aws_lb.alb.arn
}


output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}



output "web_target_group_arn" {
  value = aws_lb_target_group.main.arn
}


output "web_alb_zone_id" {
  value = aws_lb.alb.zone_id
}



output "web_alb_dns_name" {
  value = aws_lb.alb.dns_name
}


output "web_alb_arn" {
  value = aws_lb.alb.arn
}

