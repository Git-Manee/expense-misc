terraform {
  backend "s3" {
    bucket = "mkbucket-b75"
    key = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "instance" {
  instance_id = "i-03837c079c186da1f"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.mkdevops.online"
  type    = "A"
  zone_id = "Z06195201DS9N630KC87K"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}