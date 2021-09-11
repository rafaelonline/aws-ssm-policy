output "ssm_ec2_iam_role_arn" {
  description = "ARN of ssm_ec2 IAM role"
  value       = element(concat(aws_iam_role.ssm_ec2.*.arn, [""]), 0)
}

output "ssm_ec2_iam_role_name" {
  description = "Name of ssm_ec2 IAM role"
  value       = element(concat(aws_iam_role.ssm_ec2.*.name, [""]), 0)
}

output "ssm_ec2_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = element(concat(aws_iam_policy.ssm_ec2.*.arn, [""]), 0)
}

output "ssm_ec2_iam_policy_name" {
  description = "The name of the policy"
  value       = element(concat(aws_iam_policy.ssm_ec2.*.name, [""]), 0)
}

output "ssm_ec2_instance_profile_arn" {
  description = "ARN of IAM instance profile"
  value       = element(concat(aws_iam_instance_profile.ssm_ec2.*.arn, [""]), 0)
}

output "ssm_ec2_instance_profile_name" {
  description = "Name of IAM instance profile"
  value       = element(concat(aws_iam_instance_profile.ssm_ec2.*.name, [""]), 0)
}