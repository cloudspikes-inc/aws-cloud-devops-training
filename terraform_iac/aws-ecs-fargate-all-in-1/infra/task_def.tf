resource "aws_ecs_task_definition" "this" {
  family                   = "sample_api"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "nodejs-app-container"
      "image" : "${var.app_image}",
      "portMappings" : [
        { containerPort = "${var.app_port}" }
      ],
    }]
  )
}
