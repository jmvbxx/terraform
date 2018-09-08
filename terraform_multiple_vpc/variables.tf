##
#  Global
variable "AmiLinux" {
  type = "map"
  default = {
    us-west-2 = "ami-bf4193c7"
    us-west-1 = "ami-a51f27c5"
  }
  description = "The amis for associated region"
}
#  End Global
##

##
#  VPC 1
variable "region" {
  default = "us-west-2"
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
  default = "deployer-west2"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName" {
  default = "guba-terraform.test"
}
#  End VPC 1
##

##
#  VPC 2
variable "region2" {
  default = "us-west-1"
}
variable "vpc-fullcidr2" {
    default = "12.0.0.0/16"
  description = "the vpc2 cdir"
}
variable "Subnet-Public-AzA-CIDR2" {
  default = "12.0.0.0/24"
  description = "the cidr of the subnet2"
}
variable "Subnet-Private-AzA-CIDR2" {
  default = "12.0.3.0/24"
  description = "the cidr of the subnet2"
}
variable "key_name2" {
  default = "deployer-west2"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName2" {
  default = "guba2-terraform.test"
}
#  End VPC 2
##