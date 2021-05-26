#! /bin/bash

# login as sudo user 
# sudo su -

# disable firewall 
# ufw disable

# disable swap 
# swapoff -a 
# sed -i '/swap/d' /etc/fstab

# Update sysctl settings for Kubernetes networking
# cat >>/etc/sysctl.d/kubernetes.conf<<EOF
# net.bridge.bridge-nf-call-ip6tables = 1
# net.bridge.bridge-nf-call-iptables = 1
# EOF

# sysctl --system

# Ensure docker is installed 

# update the system 
sudo apt-get update

# install package dependencies 
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# download Google's public sigining key 
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg 

# Add the Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update apt package index, install kubelet, kubeadm and kubectl, and pin their version
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
