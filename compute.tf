# resource "yandex_compute_instance" "peer-one-vm" {
#   name     = "peer-one-vm"
#   hostname = "peer-one-vm"
#   metadata = {
#     "user-data" = <<-EOT
#             #cloud-config
#             datasource:
#              Ec2:
#               strict_id: false
#             ssh_pwauth: no
#             users:
#             - name: nat
#               sudo: ALL=(ALL) NOPASSWD:ALL
#               shell: /bin/bash
#               ssh_authorized_keys:
#               - ${trimspace(file(var.local_pubkey_path))}
#         EOT
#   }
#   platform_id = "standard-v2"
#   zone        = "ru-central1-a"

#   boot_disk {
#     auto_delete = true
#     mode        = "READ_WRITE"

#     initialize_params {
#       block_size = 4096
#       image_id   = data.yandex_compute_image.centos8.image_id
#       size       = 10
#       type       = "network-hdd"
#     }
#   }

#   network_interface {
#     ip_address         = "10.10.1.10"
#     nat                = true
#     security_group_ids = []
#     subnet_id          = yandex_vpc_subnet.peer-one-subnet.id
#   }

#   resources {
#     core_fraction = 5
#     cores         = 2
#     memory        = 2
#   }

#   scheduling_policy {
#     preemptible = var.is_preemptible
#   }

#   timeouts {}
# }

# resource "yandex_compute_instance" "peer-two-vm" {
#   name     = "peer-two-vm"
#   hostname = "peer-two-vm"
#   metadata = {
#     "user-data" = <<-EOT
#             #cloud-config
#             datasource:
#              Ec2:
#               strict_id: false
#             ssh_pwauth: no
#             users:
#             - name: nat
#               sudo: ALL=(ALL) NOPASSWD:ALL
#               shell: /bin/bash
#               ssh_authorized_keys:
#               - ${trimspace(file(var.local_pubkey_path))}
#         EOT
#   }
#   platform_id = "standard-v2"
#   zone        = "ru-central1-a"

#   boot_disk {
#     auto_delete = true
#     mode        = "READ_WRITE"

#     initialize_params {
#       block_size = 4096
#       image_id   = data.yandex_compute_image.centos8.image_id
#       size       = 10
#       type       = "network-hdd"
#     }
#   }

#   network_interface {
#     ip_address         = "10.20.1.10"
#     nat                = true
#     security_group_ids = []
#     subnet_id          = yandex_vpc_subnet.peer-two-subnet.id
#   }

#   resources {
#     core_fraction = 5
#     cores         = 2
#     gpus          = 0
#     memory        = 2
#   }

#   scheduling_policy {
#     preemptible = var.is_preemptible
#   }

#   timeouts {}
# }
