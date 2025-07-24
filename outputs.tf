output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.main.arn
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = aws_vpc.main.default_route_table_id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = var.create_internet_gateway ? aws_internet_gateway.main[0].id : null
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway"
  value       = var.create_internet_gateway ? aws_internet_gateway.main[0].arn : null
}

output "flow_log_id" {
  description = "The ID of the VPC Flow Log"
  value       = var.enable_flow_logs ? aws_flow_log.vpc[0].id : null
}

output "flow_log_arn" {
  description = "The ARN of the VPC Flow Log"
  value       = var.enable_flow_logs ? aws_flow_log.vpc[0].arn : null
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for VPC Flow Logs"
  value       = var.enable_flow_logs ? aws_cloudwatch_log_group.vpc_flow_logs[0].arn : null
}

output "flow_log_iam_role_arn" {
  description = "The ARN of the IAM Role for VPC Flow Logs"
  value       = var.enable_flow_logs ? aws_iam_role.vpc_flow_logs[0].arn : null
}

output "kms_key_arn" {
  description = "The ARN of the KMS key used for CloudWatch Log Group encryption"
  value       = var.enable_flow_logs && var.enable_log_group_encryption && var.log_group_kms_key_id == null ? aws_kms_key.log_group[0].arn : null
}

output "kms_key_id" {
  description = "The ID of the KMS key used for CloudWatch Log Group encryption"
  value       = var.enable_flow_logs && var.enable_log_group_encryption && var.log_group_kms_key_id == null ? aws_kms_key.log_group[0].key_id : null
}
