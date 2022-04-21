resource "aws_autoscaling_group" "hisab-web" {
  name             = "${aws_launch_configuration.hisab-web.name}-asg"
  min_size         = 1
  desired_capacity = 1
  max_size         = 2

  health_check_type = "ELB"
  load_balancers = [
    "${aws_elb.hisab-elb.id}"
  ]
  launch_configuration = aws_launch_configuration.hisab-web.name
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
  metrics_granularity = "1Minute"
  vpc_zone_identifier = [
    "${aws_subnet.hisab-subnet.id}"
  ]
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }
}