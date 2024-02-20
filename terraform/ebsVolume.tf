# Persistent storage
resource "aws_ebs_volume" "ebs_volume" {
  count             = 2
  availability_zone = element(module.vpc.azs, count.index)
  size              = 20
}

resource "aws_volume_attachment" "ebs_attachment" {
  count         = 2
  device_name   = "/dev/sdh"
  volume_id     = aws_ebs_volume.ebs_volume[count.index].id
  instance_id   = aws_instance.my_instance.id
}