provider "google" {
    credentials = file("account.json")
    project = "ubilux-backend"
    region = "europe-west4"
    zone = "europe-west4-a"
}

data "google_project" "ubilux_backend" {
    project_id = "ubilux-backend"
}

resource "google_app_engine_application" "app" {
    project = data.google_project.ubilux_backend.project_id
    location_id = "europe-west3"
}

resource "google_redis_instance" "redis" {
    name = "ubilux-redis"
    tier = "BASIC"

    redis_version = "REDIS_4_0"
    memory_size_gb = 1
}
