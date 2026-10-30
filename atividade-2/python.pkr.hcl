packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1.1"
    }
  }
}

source "docker" "python" {
  image   = "ubuntu:jammy"
  commit  = true
  changes = ["WORKDIR /app"]
}

build {
  sources = ["source.docker.python"]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip",
      "mkdir -p /app",
      "python3 -m pip install Flask"
    ]
  }

  post-processor "docker-tag" {
    repository = "ambiente-dev-python"
    tags       = ["v1"]
  }
}
