# Get the ID of a registered AMI

data "aws_ami" "devops_ami" {
  # executable_users = ["self"]
  most_recent      = true
  # name_regex       = "^myami-\\d{3}"
  owners           = ["099720109477"]     #owner of ubuntu image

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

}

data "aws_key_pair" "devops_alvin" {
  key_name = "devops_alvin"
}
