#!/bin/bash

# Install dependencies
apt-get update
apt-get -y upgrade
apt-get install -y build-essential bison flex bc libcap-dev git libboost-all-dev python python-dev python-pip llvm-3.4 \
  llvm-3.4-dev clang gcc-multilib gdb \
  libevent-dev libgoogle-perftools-dev libncurses5-dev binutils-dev nasm libiberty-dev libsdl1.2-dev liblua5.1-0-dev libsigc++-2.0-dev \
  automake cmake valgrind cloc ipython \
  python-docutils python-pygments \
  iotop htop strace linux-headers-generic \
  unzip wget curl nano vim zsh tmux byobu ssh openssh-server \
  gettext

# No password
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup OpenSSH
mkdir /var/run/sshd
echo 'root:nothingelsematters' | chpasswd
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
mkdir -p .ssh

# Add user
#useradd riyad -u 1000 -s /bin/bash --no-create-home

ln -sf /usr/bin/llvm-config-3.4 /usr/bin/llvm-config

export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu  
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu

# Setup environment
#su - riyad

# Setup ZSH
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh -s /bin/zsh
