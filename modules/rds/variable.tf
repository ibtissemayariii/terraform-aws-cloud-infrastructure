resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  auto_accept   = true  # Set to false if you want manual approval

  tags = {
    Name = "VPC Peering Connection"
  }
}
