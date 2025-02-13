
# security group

locals {
  sg_name = "${var.environment}-${var.application_name}-sg"
}

locals {
  launch_template_name = "${var.environment}-${var.application_name}-launch-template"
}

locals {
  tg_name = "${var.environment}-${var.application_name}-tg"
}

locals {
  asg_name = "${var.environment}-${var.application_name}-asg"
}

locals {
  instance_name = "${var.environment}-${var.application_name}-instance"
}
