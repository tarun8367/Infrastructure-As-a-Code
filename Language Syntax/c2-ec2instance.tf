# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami           = "ami-0230bd60aa48260c6" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}