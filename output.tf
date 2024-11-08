
# Output for the website URL
output "web_server_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

output "web_server_url" {
  description = "URL to access the website"
  value       = "http://${aws_instance.web_server.public_ip}"
}
