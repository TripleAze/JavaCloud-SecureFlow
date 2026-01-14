resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.jenkins_profile.id
  key_name               = var.key_name

  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_instance" "tomcat" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.tomcat_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "Tomcat-Server"
  }
}
