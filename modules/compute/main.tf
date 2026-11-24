data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "web" {
  count                       = var.instance_count
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids      = [var.instance_sg_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = true
  user_data_replace_on_change = true

  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    log_group_access = var.log_group_access
    log_group_error  = var.log_group_error
    logs_bucket      = var.logs_bucket_name
  })

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.name_prefix}-web-${count.index + 1}"
  }
}
