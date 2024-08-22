locals {
  azsuffix = [for az in data.aws_availability_zones.azs.names : substr(az, -2, 2)]
}
