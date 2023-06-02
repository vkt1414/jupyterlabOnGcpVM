variable "project" {
  type    = string
  default = " "
}

variable "machinetype" {
  type    = string
  default = "n1-standard-4"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "instance_name" {
  type    = string
  default = "jupyter-instance"
}

variable "boot_disk_image" {
  type    = string
  default = "ml-images/c0-deeplearning-common-cu113-v20230412-debian-10"
}

variable "gpu_type" {
  type    = string
  default = "nvidia-tesla-t4"
  #for T4 use "nvidia-telsa-t4" 
  #for more than one use count = 2
}

variable "boot_disk_size" {
  type    = number
  default = 200
}
