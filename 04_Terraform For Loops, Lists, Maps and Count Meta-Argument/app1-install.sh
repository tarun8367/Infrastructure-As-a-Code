#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html

# Exit on error
set -e

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd

cat <<EOF | sudo tee /var/www/html/index.html
<h1>Welcome to StackSimplify - APP-1</h1>
EOF

if [ ! -d "/var/www/html/app1" ]; then
    sudo mkdir /var/www/html/app1
fi

cat <<EOF | sudo tee /var/www/html/app1/index.html
<!DOCTYPE html>
<html>
<body style="background-color:rgb(250, 210, 210);">
  <h1>Welcome to Stack Simplify - APP-1</h1>
  <p>Terraform Demo</p>
  <p>Application Version: V1</p>
</body>
</html>
EOF

sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
