# ## Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vnet.id
	tags = merge(
      local.tags,
      {
        Name = "Demo Internet Gateway"
      },
    )
}