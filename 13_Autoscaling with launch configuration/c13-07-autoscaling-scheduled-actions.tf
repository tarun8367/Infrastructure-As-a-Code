## Create Scheduled Actions
### Create Scheduled Action-1: Increase capacity during business hours
resource "aws_autoscaling_schedule" "increase_capacity_9am" {
  scheduled_action_name  = "increase-capacity-9am"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 8
  start_time             = "2023-11-30T09:00:00Z" # Time should be provided in UTC Timezone (11am UTC = 7AM EST)
  recurrence             = "00 09 * * *"
  autoscaling_group_name = module.autoscaling.autoscaling_group_id
}
### Create Scheduled Action-2: Decrease capacity during business hours
resource "aws_autoscaling_schedule" "decrease_capacity_9pm" {
  scheduled_action_name  = "decrease-capacity-9pm"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  start_time             = "2023-11-30T21:00:00Z"  # Time should be provided in UTC Timezone (9PM UTC = 5PM EST)
  recurrence             = "00 21 * * *"
  autoscaling_group_name = module.autoscaling.autoscaling_group_id
}