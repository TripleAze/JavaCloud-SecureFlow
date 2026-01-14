output "jenkins_public_ip" {
  description = "Public IP of Jenkins server"
  value       = aws_instance.jenkins.public_ip
}

output "tomcat_public_ip" {
  description = "Public IP of Tomcat server"
  value       = aws_instance.tomcat.public_ip
}

output "jenkins_private_ip" {
  description = "Private IP of Jenkins server"
  value       = aws_instance.jenkins.private_ip
}

output "tomcat_private_ip" {
  description = "Private IP of Tomcat server"
  value       = aws_instance.tomcat.private_ip
}
