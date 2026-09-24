resource "aws_security_group" "msk" {
  name        = "${var.project_name}-msk-sg"
  description = "Security group for Amazon MSK"
  vpc_id      = aws_vpc.iot.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-msk-sg"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "msk_kafka" {
  security_group_id = aws_security_group.msk.id

  cidr_ipv4 = aws_vpc.iot.cidr_block

  from_port = 9092
  to_port   = 9092

  ip_protocol = "tcp"

  description = "Allow Kafka traffic from within the IoT VPC"
}

resource "aws_vpc_security_group_egress_rule" "msk_all" {
  security_group_id = aws_security_group.msk.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow outbound traffic"
}