terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id = "b1gtrb1pnt0mnhlbb7nc"
  folder_id = "b1gm8plftfp0sfg5mg0r"
  zone =  "ru-central1-a"
}

variable "image_id" {
 description = "fd8pnse1rshdvced0u8h"
}

variable "vm_name" {
 description = "my-vm"
}

resource "yandex_compute_instance" "vm" {
  name         = var.vm_name
  platform_id  = "standard-v1"
  zone         = var.yandex_zone
  resources {
    cores = 2
    memory = 2
  }
  boot_disk{
initialize_params {
      image_id = "fd8pnse1rshdvced0u8h"

      size = 10
    }
}
  network_interface {
    subnet_id = yandex_vpc_subnet.vm_subnet.id
  }
}


variable "vm_network" {
  description = "my-network"
}

variable "vm_subnet" {
  description = "my-subnet"
}

variable "dns_zone" {
  description = "comp2.hackatom.ru"
}

variable "yandex_zone" {
 description = "ru-center1-a"
}

resource "yandex_vpc_network" "vm_network" {
  name = var.vm_network
  
}

resource "yandex_vpc_subnet" "vm_subnet" {
  name             = "my-security-group"
  network_id       = yandex_vpc_network.vm_network.id
  v4_cidr_blocks   = ["10.20.20.0/24"]
}

resource "yandex_vpc_security_group" "vm_sec" {
  name        = "my-security-group"
  description = "Security-group-for-VM"
  network_id  = yandex_vpc_network.vm_network.id
}

output "public_ip" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}
