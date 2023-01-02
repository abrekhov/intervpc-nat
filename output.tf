# output "one" {
#   value = "ssh nat@${yandex_compute_instance.peer-one-vm.network_interface[0].nat_ip_address}"
# }
# output "two" {
#   value = "ssh nat@${yandex_compute_instance.peer-two-vm.network_interface[0].nat_ip_address}"
# }
output "nat" {
  value = "ssh nat@${yandex_compute_instance.nat.network_interface[0].nat_ip_address}"
}
