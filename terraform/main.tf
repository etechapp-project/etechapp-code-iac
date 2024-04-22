terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

   backend "s3" {
       bucket = "team9-infra-state"
       key    = "eng-state/"
       region = "us-east-1"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "team8-test"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[BUCKET_NAME_HERE]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}

