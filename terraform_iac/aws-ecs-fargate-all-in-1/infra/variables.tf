variable "app_image" {
  type        = string
  description = "Docker image from ECR to deploy on ECS Fargate Cluster."
}

variable "app_port" {
  type        = number
  description = "Docker port on ECS Fargate Cluster."
}