terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"
}
variable "cloud_id" {
  description = "b1gtrb1pnt0mnhlbb7nc"
  type        = string
}

variable "folder_id" {
  description = "b1gm8plftfp0sfg5mg0r"
  type        = string
}
