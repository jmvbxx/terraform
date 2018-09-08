##
#  Global
variable "AmiLinux" {
  type = "map"
  default = {
    us-east-2 = "ami-965e6bf3"
  }
  description = "The amis for associated region"
}
#  End Global
##

variable "region" {
  default = "us-east-2"
}
variable "vpc-fullcidr" {
    default = "11.0.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "11.0.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "11.0.3.0/24"
  description = "the cidr of the subnet"
}
variable "key_name" {
  default = "deployer-east2"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
  default = "guba-terraform.test"
}