variable "vpc2-fullcidr" {
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