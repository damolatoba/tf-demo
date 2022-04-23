resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.vnet.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags = merge(
    local.tags,
    {
      Name = "Demo Route Table 01"
    },
  )

}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.zone_a.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}