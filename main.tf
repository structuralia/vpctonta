provider "aws" {
  region = "eu-west-3" # Paris
}
################################################################################
# VPC Module
# https://github.com/terraform-aws-modules/terraform-aws-vpc
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
################################################################################
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # VPC Basic Details
  name = "${var.env}-${var.project_name}-vpc"
  cidr = var.vpc_cidr

  azs                 = local.azs
  private_subnets     = local.private_subnets
  public_subnets      = local.public_subnets
  database_subnets    = local.database_subnets 

  public_subnet_names   = ["${var.env}-subnet-public-a", "${var.env}-subnet-public-b", "${var.env}-subnet-public-c"]
  private_subnet_names  = ["${var.env}-subnet-private-app-a", "${var.env}-subnet-private-app-b", "${var.env}-subnet-private-app-c"]
  database_subnet_names = ["${var.env}-subnet-private-db-a", "${var.env}-subnet-private-db-b", "${var.env}-subnet-private-db-c"]

  create_database_subnet_group  = false
  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  # ING
  create_igw           = true

  # NAT Gateways - Outbound Communication
  # Un NAT Gateways por AZ
  enable_nat_gateway      = true
  single_nat_gateway      = false
  one_nat_gateway_per_az = true

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = merge(
    local.tags,
    {

    },
  )

}
# -------------------------
# Creación de la vpc
# -------------------------
# resource "aws_vpc" "vpc" {
#  cidr_block = var.vpc_cidr
#  enable_dns_support = true
#  enable_dns_hostnames = true

#}
