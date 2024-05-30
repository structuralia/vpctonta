provider "aws" {
  region = "eu-west-3" # Paris
}

# -------------------------
# Creación de la vpc
# -------------------------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

}
