# TF file for EC2

resource "aws_instance" "jenkins" {
  ami = data.aws_ami.devops_ami.image_id
  # ami = "ami-02da34c96f69d525c"
  associate_public_ip_address = true
  
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.devops_alvin.key_name
  subnet_id   = aws_subnet.jenkins_subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = "jenkins_ec2"
  }
}

resource "aws_instance" "web" {
  ami   = data.aws_ami.devops_ami.image_id
  # ami = "ami-02da34c96f69d525c"
  associate_public_ip_address = true
  
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.devops_alvin.key_name
  subnet_id   = aws_subnet.web_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  tags = {
    Name = "web_ec2"
  }
}

