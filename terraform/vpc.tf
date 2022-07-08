
resource "aws_vpc" "devops_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "devops_vpc"
  }
}

resource "aws_subnet" "jenkins_subnet" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "jenkins_subnet"
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = "172.16.20.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "web_subnet"
  }
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id            = aws_vpc.devops_vpc.id
  tags = {
    Name = "devops_igw"
  }
}

resource "aws_route_table" "devops_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }

  tags = {
    Name = "devops_rt"
  }
}

resource "aws_route_table_association" web_rt_assoc {
  subnet_id      = aws_subnet.web_subnet.id
  route_table_id = aws_route_table.devops_rt.id
}

resource "aws_route_table_association" jenkins_rt_assoc {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.devops_rt.id
}


resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow SSH from admin IP"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    description      = "Allow SSH From Admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.admin_cidr]
    #ipv6_cidr_blocks = [aws_vpc.devops_vpc.ipv6_cidr_block]
  }

  ingress {
    description      = "Jenkins port from anywhere"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP inbound traffic and SSH from jenkins server"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    description      = "HTTP from anywhere"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH from Jenkins server"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_subnet.jenkins_subnet.cidr_block]
    #ipv6_cidr_blocks = aws_subnet.jenkins_subnet.ipv6_cidr_blocks
  }

  ingress {
    description      = "Allow SSH From Admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.admin_cidr]
    #ipv6_cidr_blocks = [aws_vpc.devops_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web_sg"
  }
}
