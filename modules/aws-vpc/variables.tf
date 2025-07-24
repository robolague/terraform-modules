variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "The cidr_block must be a valid CIDR block."
  }
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "create_internet_gateway" {
  description = "Whether to create an Internet Gateway for the VPC"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {}
}

variable "enable_flow_logs" {
  description = "Enable VPC Flow Logs for security monitoring"
  type        = bool
  default     = true
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Valid values: cloud-watch-logs, s3"
  type        = string
  default     = "cloud-watch-logs"
  validation {
    condition     = contains(["cloud-watch-logs", "s3"], var.flow_log_destination_type)
    error_message = "Flow log destination type must be either 'cloud-watch-logs' or 's3'."
  }
}

variable "flow_log_retention_days" {
  description = "Number of days to retain flow logs in CloudWatch Logs"
  type        = number
  default     = 7
  validation {
    condition     = var.flow_log_retention_days >= 1 && var.flow_log_retention_days <= 2555
    error_message = "Flow log retention days must be between 1 and 2555."
  }
}

variable "flow_log_traffic_type" {
  description = "Type of traffic to log. Valid values: ACCEPT, REJECT, ALL"
  type        = string
  default     = "ALL"
  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_log_traffic_type)
    error_message = "Flow log traffic type must be either 'ACCEPT', 'REJECT', or 'ALL'."
  }
}

variable "enable_log_group_encryption" {
  description = "Enable KMS encryption for CloudWatch Log Group"
  type        = bool
  default     = true
}

variable "log_group_kms_key_id" {
  description = "KMS Key ID for CloudWatch Log Group encryption. If not provided, AWS managed key will be used"
  type        = string
  default     = null
} 