#!/bin/bash

set -euo pipefail

banner=' ██████╗ ██████╗ ██████╗  █████╗ ██╗
██╔════╝██╔═══██╗██╔══██╗██╔══██╗██║
██║     ██║   ██║██║  ██║███████║██║
██║     ██║   ██║██║  ██║██╔══██║██║
╚██████╗╚██████╔╝██████╔╝██║  ██║██║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
                                    '

echo -e "$banner"
echo "=> CODAI server tool is for fresh Ubuntu Server 24.04 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning CODAI SERVER BUILDER..."
rm -rf ~/.local/share/codai-server-builder
git clone https://github.com/ailsonrm/codai-server-builder.git ~/.local/share/codai-server-builder >/dev/null
         

CODAI_SERVER_BUILDER_REF=${CODAI_SERVER_BUILDER_REF:-"stable"}

if [[ $CODAI_SERVER_BUILDER_REF != "main" ]]; then
  cd ~/.local/share/codai-server-builder
  git fetch origin "$CODAI_SERVER_BUILDER_REF" && git checkout "$CODAI_SERVER_BUILDER_REF"
  cd - >/dev/null
fi

echo "Installation starting..."
source ~/.local/share/codai-server-builder/install.sh
