# outputs.tf - Outputs for all assignments

# Assignment 1 Outputs
output "assignment1_instance_id" {
  value = var.enable_assignment1 ? aws_instance.assignment1_instance[0].id : "Assignment 1 disabled"
}

output "assignment1_public_ip" {
  value = var.enable_assignment1 ? aws_instance.assignment1_instance[0].public_ip : "Assignment 1 disabled"
}

# Assignment 2 Outputs
output "assignment2_instance_id" {
  value = var.enable_assignment2 ? aws_instance.assignment2_instance[0].id : "Assignment 2 disabled"
}

output "assignment2_elastic_ip" {
  value = var.enable_assignment2 ? aws_eip.assignment2_eip[0].public_ip : "Assignment 2 disabled"
}

# Assignment 3 Outputs
output "assignment3_ohio_ip" {
  value = var.enable_assignment3 ? aws_instance.assignment3_ohio[0].public_ip : "Assignment 3 disabled"
}

output "assignment3_virginia_ip" {
  value = var.enable_assignment3 ? aws_instance.assignment3_virginia[0].public_ip : "Assignment 3 disabled"
}

# Assignment 4 Outputs
output "assignment4_vpc_id" {
  value = var.enable_assignment4 ? aws_vpc.assignment4_vpc[0].id : "Assignment 4 disabled"
}

output "assignment4_instance_ip" {
  value = var.enable_assignment4 ? aws_instance.assignment4_instance[0].public_ip : "Assignment 4 disabled"
}

# Assignment 5 Outputs
output "assignment5_instance_ip" {
  value = var.enable_assignment5 ? aws_instance.assignment5_instance[0].public_ip : "Assignment 5 disabled"
}

output "assignment5_ip_file" {
  value = var.enable_assignment5 ? "IP address saved to assignment5_instance_ip.txt" : "Assignment 5 disabled"
}