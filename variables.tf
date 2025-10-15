# variables.tf - Control which assignments to deploy

variable "enable_assignment1" {
  description = "Enable Assignment 1: Basic EC2 in Ohio"
  type        = bool
  default     = true
}

variable "enable_assignment2" {
  description = "Enable Assignment 2: EC2 with Elastic IP"
  type        = bool
  default     = true
}

variable "enable_assignment3" {
  description = "Enable Assignment 3: Multi-Region Instances"
  type        = bool
  default     = true
}

variable "enable_assignment4" {
  description = "Enable Assignment 4: VPC with EC2"
  type        = bool
  default     = true
}

variable "enable_assignment5" {
  description = "Enable Assignment 5: EC2 with Apache"
  type        = bool
  default     = true
}