# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public, module.vpc, aws_eip.bastion_eip]

  # Connection Block for Provisioners to connect to EC2 Instance

  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }

  # Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }

  # Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command     = "echo VPC created on $(date) and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }
  ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  # provisioner "local-exec" {
  #   command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
  #   working_dir = "local-exec-output-files/"
  #   # when = destroy
  #   #on_failure = continue
  # }    
}