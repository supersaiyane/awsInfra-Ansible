#!/bin/bash

# Update package list and the OS packages
apt-get update -y
apt-get upgrade -y

# # Install prerequisites
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install git
apt-get install -y git

# Install ping utility
apt-get install -y iputils-ping

# Install curl
apt-get install -y curl

# Install wget
apt-get install -y wget

# Install unzip
apt-get install -y unzip

# Install kubeadm, kubectl and kubelet
apt-get update -y && apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg -y
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Install AWS CLI version 2
curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -y

# Verify installations
git --version
ping -c 1 8.8.8.8
curl --version
wget --version
unzip -v
kubeadm version
kubectl version --client
aws --version

echo "All specified packages are installed successfully."
