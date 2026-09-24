data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "msk" {
  count = 3

  vpc_id = aws_vpc.iot.id

  cidr_block = cidrsubnet(
    aws_vpc.iot.cidr_block,
    8,
    count.index + 1
  )

  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-msk-${count.index + 1}"
    }
  )
}