data "aws_ssm_parameter" "target_group_arns" {
  name = "/timing/vpc/target_group_arns"
}


data "aws_ssm_parameter" "app_alb_arn" {
  name = "/timing/vpc/app_alb_arn"
}
