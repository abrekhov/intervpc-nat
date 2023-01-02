resource "yandex_vpc_route_table" "rt-one-to-two" {
  network_id = yandex_vpc_network.peer-one.id
  name       = "rt-one-to-two"

  static_route {
    destination_prefix = "10.20.1.0/24"
    next_hop_address   = "10.10.1.100"
  }
}

resource "yandex_vpc_route_table" "rt-two-to-one" {
  network_id = yandex_vpc_network.peer-two.id
  name       = "rt-two-to-one"

  static_route {
    destination_prefix = "10.10.1.0/24"
    next_hop_address   = "10.20.1.100"
  }
}
