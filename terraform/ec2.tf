# TF file for EC2

resource "aws_instance" "devops_alvin" {
  ami = data.aws_ami.devops_ami.image_id
  # ami = "ami-02da34c96f69d525c"
  
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.devops_alvin.key_name
  tags = {
    Name = "${var.name}"
  }
}

