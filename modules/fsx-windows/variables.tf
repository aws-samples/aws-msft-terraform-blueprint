variable "automatic_backup_retention_days" {
  type        = number
  default     = 7
  description = "The number of days to retain automatic backups. Minimum of 0 and maximum of 90"
}

variable "deployment_type" {
  type        = string
  default     = "SINGLE_AZ_1"
  description = "Specifies the file system deployment type, valid values are MULTI_AZ_1, SINGLE_AZ_1 and SINGLE_AZ_2"
  validation {
    condition     = contains(["MULTI_AZ_1", "SINGLE_AZ_1", "SINGLE_AZ_2"], var.deployment_type)
    error_message = "The storage type value must be MULTI_AZ_1, SINGLE_AZ_1, or SINGLE_AZ_2"
  }
}

variable "fsx_kms_key" {
  type        = string
  default     = "aws/fsx"
  description = "ARN for the KMS Key to encrypt the file system at rest"
}

variable "managed_ad_fqdn" {
  type        = string
  description = "FQDN of the AWS Managed Microsoft AD"
}

variable "managed_ad_id" {
  type        = string
  description = "Directory ID of the AWS Managed Microsoft AD"
}

variable "storage_capacity" {
  type        = number
  default     = 32
  description = "Storage capacity (GiB) of the file system. Minimum of 32 and maximum of 65536"
}

variable "storage_type" {
  type        = string
  default     = "SSD"
  description = "Specifies the storage type, valid values are SSD and HDD"
  validation {
    condition     = contains(["HDD", "SSD"], var.storage_type)
    error_message = "The storage type value must be HDD or SSD."
  }
}

variable "throughput_capacity" {
  type        = number
  default     = 16
  description = "Throughput (megabytes per second) of the file system in power of 2 increments. Minimum of 8 and maximum of 2048"
}

variable "tcp_amazon_fsx_ingress_ports" {
  type = list(number)
  default = [
    "53",
    "88",
    "464",
    "389",
    "123",
    "135",
    "445",
    "636",
    "3268",
    "3269",
    "5985",
  "9389"]
  description = "List of security group TCP ports for Amazon FSx Windows"
}

variable "udp_amazon_fsx_ingress_ports" {
  type = list(number)
  default = [
    "88",
    "464",
    "389",
    "123",
  ]
  description = "List of security UDP group ports for Amazon FSx Windows"
}
