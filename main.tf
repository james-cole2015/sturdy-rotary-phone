#----------------------------------------------------------------#
## Creating Key Pair for universal use without fear of deleting ##
#----------------------------------------------------------------#

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "m-davis-key"
  create_private_key = true
}

#----------------------------------------------------------------#
##          Storing Keypairs in Secrets Manager                 ##
#----------------------------------------------------------------#

resource "aws_secretsmanager_secret" "private-key" {
  name = "m-davis-private-key"
  tags = {
    "name" = "matthewDavis"
  }
}

resource "aws_secretsmanager_secret" "public-key" {
  name = "m-davis-public-key"
  tags = {
    "name" = "matthewDavis"
  }
}


resource "aws_secretsmanager_secret_version" "keypair" {
  secret_id     = aws_secretsmanager_secret.private-key.id
  secret_string = module.key_pair.private_key_pem
  tags = {
    "name" = "matthewDavis"
  }
}

resource "aws_secretsmanager_secret_version" "pub_keypair" {
  secret_id     = aws_secretsmanager_secret.public-key.id
  secret_string = module.key_pair.public_key_pem
  tags = {
    "name" = "matthewDavis"
  }
}
