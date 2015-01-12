#!/bin/bash

# Install dependencies
apt-get update
apt-get -y upgrade
apt-get --ignore-missing –install-suggests install -y build-essential bison flex bc libcap-dev libboost-all-dev python python-dev python-pip llvm-3.4 \
  llvm-3.4-dev clang gcc-multilib gdb gcc-dev \
  libevent-dev libgoogle-perftools-dev libncurses5-dev binutils-dev nasm libiberty-dev libsdl1.2-dev liblua5.1-0-dev libsigc++-2.0-dev \
  libc6-dev-i386 libtool binutils-dev libsdl-dev \
  subversion git diffutils findutils binutils \
  qemu qemu-kvm qemu-utils automake cmake valgrind cloc ipython debootstrap \
  python-docutils python-pygments \
  iotop htop strace linux-headers-generic kernel-package \
  unzip wget curl nano vim zsh tmux screen byobu ssh openssh-server \
  gettext locales sudo

# No passwoord
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
