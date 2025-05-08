# CODAI Server Builder

Uma ferramenta abrangente de configuração pós-instalação para servidores Ubuntu, simplificando o processo de setup e implementando boas práticas.

## 🚀 Funcionalidades

 - Configuração automatizada pós-instalação

 - Definições de reforço de segurança (hardening)

 - Instalação de softwares comuns para servidores

 - Otimizações de desempenho

## 📋 Pré-requisitos

- Apenas para Windows -> Não rodar no GitBash(tem limite de tempo), rodar no PowerShell ou CMD
- Ubuntu Server (24.04)
- Acesso root ou via sudo
- Criação alias de status

  ```bash
    echo "alias status='run-parts /etc/update-motd.d/'" >> ~/.bashrc

    source ~/.bashrc
   ```

- Configuração do Host
  
  ```bash
    hostnamectl set-hostname codai-swarm-manager-01
    
    nano /etc/hosts
    
    reboot
  ```

- Atualização automática
  ```bash
    apt update
    apt upgrade
    apt install unattended-upgrades
    dpkg-reconfigure unattended-upgrades

    crontab -e

    #Reboot automático:
    0 3 * * 0 /sbin/shutdown -r +15
  ```
- Gerar public key
  ```bash
  ssh-keygen -t rsa -b 4096 -C "ailson.rm.dev@gmail.com"
  ```

- Usuário administrativo
  ```bash
    adduser codai
    usermod -a -G sudo codai
  ```

- Conexão SSH via chaves privada e pública
  ```bash
    mkdir ~/.ssh
    nano ~/.ssh/authorized_keys
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/*
  ```

- Ajuste no daemon ssh
  ```bash
    nano /etc/ssh/sshd_config

    PermitRootLogin no
    PasswordAuthentication no
    PermitEmptyPasswords no
    X11Forwarding no

    #Verificar se tem arquivos sobrescrevendo o sshd_config com ono caso do VPS servla que tinha

    #/etc/ssh/sshd_config.d/60-cloudimg-settings.conf:PasswordAuthentication no
    /etc/ssh/sshd_config.d/50-cloud-init.conf:PasswordAuthentication yes


    grep -Ri 'PasswordAuthentication' /etc/ssh/sshd_config.d/

    #Isso faz o cloud-init não alterar mais o SSH na próxima inicialização!

    sudo nano /etc/cloud/cloud.cfg.d/99-disable-ssh.cfg

    ssh_deletekeys: 0
    ssh_genkeytypes: []
    disable_root: false
    preserve_hostname: true
    ssh_pwauth:   0
  ```

- Firewall
  ```bash
  
  
  sudo ufw allow 22
  sudo ufw allow http
  sudo ufw allow https
  sudo ufw status
  sudo ufw enable #para habilitar
  sudo ufw disable
  ```

## 💡 Uso

Execute o script de configuração no seu servidor:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/ailsonrm/codai-server-builder/refs/heads/main/boot.sh)

ou 

curl -sSL https://raw.githubusercontent.com/ailsonrm/codai-server-builder/refs/heads/main/boot.sh | sudo bash

```

## 🐋 Docker Swarm

Se você precisar utilizar Docker Swarm, execute:

```bash
docker swarm init --advertise-addr="<ip da VPS>"
docker network create --driver=overlay network_public
```

## 📝 Licença

CODAI Server Builder é distribuído sob a [Licença MIT](https://opensource.org/licenses/MIT).