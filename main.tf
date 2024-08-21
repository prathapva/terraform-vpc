resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

## Public Subnet
resource "aws_subnet" "public" {
  count             = length(var.publicsnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.publicsnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]

  tags = { Name = format("${var.vpc_name}-${var.publicsnet_prefix}-$", substr(element(data.aws_availability_zones.azs.group_names, count.index), 0, -2))
  }
}
