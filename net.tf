resource "yandex_vpc_network" "peer-one" {
  name = "peer-one"
}

resource "yandex_vpc_network" "peer-two" {
  name = "peer-two"
}

resource "yandex_vpc_subnet" "peer-one-subnet" {
  network_id     = yandex_vpc_network.peer-one.id
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.10.1.0/24"]
  route_table_id = yandex_vpc_route_table.rt-one-to-two.id
}

resource "yandex_vpc_subnet" "peer-two-subnet" {
  network_id     = yandex_vpc_network.peer-two.id
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.20.1.0/24"]
  route_table_id = yandex_vpc_route_table.rt-two-to-one.id
}

