provider "aws" {}

module "sg" {
  source      = "github.com/Emerson89/security-group-aws-terraform.git?ref=v1.0.0"
  sgname      = "sgtest"
  environment = "hml"
  vpc_id      = var.vpc_id

  rules_security_group = {

    ## Rule ingress cidr_block
    ingress_rule_1 = {
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      type        = "ingress"
      cidr_blocks = ["172.31.0.0/16"]
    }
  }

  tags = {
    Environment = "hml"
  }

}
