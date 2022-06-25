output "key_fingerprint" {
  value = data.aws_key_pair.devops_alvin.fingerprint
}

output "key_name" {
  value = data.aws_key_pair.devops_alvin.key_name
}

output "ami_name" {
  value = data.aws_ami.devops_ami.name
}