data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Define a new resource of the EC2 instace type
resource "aws_instance" "devops_academy_ec2" {
  ami               = data.aws_ami.aws-linux.id
  availability_zone = "ap-southeast-2a"
  instance_type     = "t2.micro"
  iam_instance_profile = "ec2-read-s3-role-tf-profile2"
  subnet_id = "subnet-04843486979b4aeb2"
  vpc_security_group_ids      = [aws_security_group.da-allow_ssh-tf.id]
  associate_public_ip_address = true
  key_name = "da"
  tags = {
    Name = "DevOps_Academy_Terraform_1st_EC2"
  }
}