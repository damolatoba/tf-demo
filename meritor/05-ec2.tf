resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_ed25519.pub")
}

/* data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["ubuntu"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }
} */

resource "aws_instance" "default" {
  ami                  = "ami-04505e74c0741db8d"
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.deployer.key_name
  security_groups      = [aws_security_group.allow_tls.id]
  subnet_id            = aws_subnet.zone_a.id
  iam_instance_profile = aws_iam_instance_profile.default.name

  tags = merge(
    local.tags,
    {
      Name = "Demo Linux VM 01"
    },
  )
}

## Elastic IP
resource "aws_eip" "public" {
  instance = aws_instance.default.id
  vpc      = true
  tags = merge(
    local.tags,
    {
      Name = "Demo Public IP 01"
    },
  )
}

# NIC
resource "aws_network_interface" "instance_nic" {
  subnet_id       = aws_subnet.zone_a.id
  security_groups = ["${aws_security_group.allow_tls.id}"]
  tags = merge(
    local.tags,
    {
      Name = "Demo Linux NIC 01"
    },
  )
}