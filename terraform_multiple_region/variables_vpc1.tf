variable "AmiLinux" {
  type = "map"
  default = {
    us-west-1 = "ami-a51f27c5"
    us-west-2 = "ami-bf4193c7"
    us-east-2 = "ami-15e9c770"
  }
}

variable "peering_id"               {
  default =  "pcx-0e0b234bea04913b9"
}

variable "vpc-fullcidr"             {
  default = "11.0.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR"   {
  default = "11.0.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-AzA-CIDR"  {
  default = "11.0.3.0/24"
  description = "the cidr of the subnet"
}
variable "key_name"                 {
#  default = "deployer-west1"
  default = "deployer-east2"
  description = "the ssh key to use in the EC2 machines"
}
variable "DnsZoneName"              {
  default = "guba-terraform.test"
}