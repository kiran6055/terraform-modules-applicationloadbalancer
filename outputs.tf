output "target_group_arns" {
  value = aws_lb_target_group.main.arn
}


output "app_alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}



output "app_alb_zone_id" {
  value = aws_lb.app_alb.zone_id
}

output "alb_arn" {
  value = aws_lb.app_alb.arn
}
