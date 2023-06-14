variable "region" {
  type = string
  validation {
    condition     = startswith(var.region, "us")
    error_message = "Region must be in Europe"
  }
  default = "eu-central-1"
}


variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "ami" {
  type    = string
  default = "ami-07151644aeb34558a"
}

variable "iam_users" {
  type    = set(string)
  default = ["jack", "john"]

}
variable "password" {
  description = "The root password for our VM"
  type        = string
  default     = "p4ssw0rd"
}

variable "aws" {
  type = object({
    ami = string, instance_type = string
  })
  default = {
    ami           = "ami-07151644aeb34558a",
    instance_type = "t2.micro"
  }

}
