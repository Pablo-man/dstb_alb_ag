#!/bin/bash

# Instalar Docker si no está instalado
if ! command -v docker &> /dev/null; then
  echo "Docker no está instalado. Instalando..."
  sudo apt update
  sudo apt install -y docker.io
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -aG docker $USER
  sudo systemctl restart docker
else
  echo "Docker ya está instalado."
fi

# Asegurar que Docker esté activo
if ! sudo systemctl is-active --quiet docker; then
  echo "Docker no está activo. Iniciando..."
  sudo systemctl start docker
fi

# Actualizar y ejecutar el contenedor
IMAGE=$1
echo "Desplegando la imagen $IMAGE..."
sudo docker pull $IMAGE
sudo docker stop $(docker ps -q) || true
sudo docker run -d -p 3000:3000 $IMAGE
