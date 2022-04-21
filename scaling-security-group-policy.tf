resource "aws_autoscaling_policy" "hisab-autoscaling-policy" {
  name                   = "hisab-autoscaling-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.hisab-web.name
}
resource "aws_cloudwatch_metric_alarm" "hisab-cpu-alarm" {
  alarm_name          = "hisab-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "70"
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.hisab-web.name}"
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = ["${aws_autoscaling_policy.hisab-autoscaling-policy.arn}"]
}
resource "aws_autoscaling_policy" "hisab-autoscaling-down" {
  name                   = "hisab-autoscaling-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.hisab-web.name
}
resource "aws_cloudwatch_metric_alarm" "hisab-cpu-alarm-down" {
  alarm_name          = "hisab-cpu-alarm-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.hisab-web.name}"
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = ["${aws_autoscaling_policy.hisab-autoscaling-down.arn}"]
}