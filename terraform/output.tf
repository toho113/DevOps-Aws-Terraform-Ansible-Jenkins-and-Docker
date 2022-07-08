# output "key_fingerprint" {
#   value = data.aws_key_pair.devops_alvin.fingerprint
# }

output "key_name" {
  value = data.aws_key_pair.devops_alvin.key_name
}

output "ami_name" {
  value = data.aws_ami.devops_ami.name
}

output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_priv_ip" {
  value = aws_instance.jenkins.private_ip
}

output "web_ip" {
  value = aws_instance.web.public_ip
}

output "web_priv_ip" {
  value = aws_instance.web.private_ip
}
