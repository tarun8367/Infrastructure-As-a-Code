
# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
data "aws_ec2_instance_type_offerings" "my_zones" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}


#OUTPUT 

# Create a Map with Key as Availability Zone and value as Instance Type supported
output "output_v3_1" {
 value = { for az, details in data.aws_ec2_instance_type_offerings.my_zones :
  az => details.instance_types }   
}

#Exclude unsupported types
output "output_v3_2" {
 value = { for az, details in data.aws_ec2_instance_type_offerings.my_zones :
  az => details.instance_types if length(details.instance_types)!= 0}   
}

#GEt the keys only
output "output_v3_3" {
 value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_zones :
  az => details.instance_types if length(details.instance_types)!= 0} )  
}