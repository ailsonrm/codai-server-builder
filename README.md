# CODAI Server Builder

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

An comprehensive post-installation configuration tool for Ubuntu servers, streamlining the setup process and implementing best practices.

## 🚀 Features

- Automated post-installation configuration
- Security hardening settings
- Common server software setup
- Performance optimizations

## 📋 Prerequisites

- Ubuntu Server (20.04)
- Root or sudo access
- Basic command line knowledge

## 💡 Usage

Run the setup script on your server:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/ailsonrm/codai-server-builder/refs/heads/main/boot.sh)
```

## 🐋 Docker Swarm

If you need to use Docker Swarm run:

```bash
docker swarm init --advertise-addr="<public ip>"
docker network create --driver=overlay network_public
```

## 📝 License

CODAI Server Builder is released under the [MIT License](https://opensource.org/licenses/MIT).