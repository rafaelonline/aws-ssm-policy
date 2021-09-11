variable region {
  type        = string
  default     = "us-east-1"
  description = "description"
}

variable tags {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default = {
    Owner       = "DevOps"
    environment = "production"
  }

}