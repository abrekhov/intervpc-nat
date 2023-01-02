data "yandex_compute_image" "centos8" {
  family = "centos-stream-8"
}

# yandex_compute_instance.nat:
resource "yandex_compute_instance" "nat" {
  description = "nat-intance"
  hostname    = "nat-intance"
  metadata = {
    "user-data" = <<-EOT
            #cloud-config
            ssh_pwauth: no
            runcmd:
            - echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
            - sysctl -p
            users:
            - name: nat
              sudo: ALL=(ALL) NOPASSWD:ALL
              shell: /bin/bash
              ssh_authorized_keys:
              - ${file(var.local_pubkey_path)}
            network:
              version: 1
              config:
                - type: route
                  destination: 10.20.1.0/24
                  gateway: 10.20.1.100
                - type: route
                  destination: 10.10.1.0/24
                  gateway: 10.10.1.100
        EOT
  }
  name        = "nat-intance"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  boot_disk {
    auto_delete = true
    mode        = "READ_WRITE"

    initialize_params {
      block_size = 4096
      image_id   = data.yandex_compute_image.centos8.image_id
      size       = 10
      type       = "network-hdd"
    }
  }

  network_interface {
    ip_address         = "10.10.1.100"
    nat                = true
    security_group_ids = []
    subnet_id          = yandex_vpc_subnet.peer-one-subnet.id
  }

  network_interface {
    ip_address         = "10.20.1.100"
    nat                = false
    security_group_ids = []
    subnet_id          = yandex_vpc_subnet.peer-two-subnet.id
  }

  resources {
    core_fraction = 50
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = var.is_preemptible
  }

  timeouts {}
}
