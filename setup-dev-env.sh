#!/bin/bash

# Install dependencies
apt-get update
apt-get -y upgrade
apt-get --ignore-missing install -y build-essential bc libcap-dev libboost-all-dev python python-dev python-pip llvm-3.5 \
  llvm-3.5-dev libasan1 clang gcc-multilib g++-multilib gdb ctags cscope automake cmake valgrind cloc indent \
  libevent-dev libgoogle-perftools-dev libncurses5-dev binutils-dev nasm libiberty-dev libsdl1.2-dev liblua5.1-0-dev libsigc++-2.0-dev \
  libvirt-dev libvirt-bin uml-utilities user-mode-linux \
  libtool binutils-dev libelf-dev libsdl-dev linux-tools-common linux-base linaro-image-tools linux-crashdump \
  libc6-dev-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1-dev libuv-dev \
  linux-headers-generic kernel-package linux-tools-generic linux-tools-virtual linux-tools-lowlatency sendfile \
  subversion git diffutils findutils binutils fakeroot elfutils patchutils zlib1g \
  qemu qemu-kvm qemu-utils ipython debootstrap sysfsutils \
  docbook-utils rsync flex bison \
  libfdt1 libfdt-dev libpopt-dev libprotobuf-dev \
  iotop htop strace systemtap kpartx google-perftools \
  slirp socat \
  unzip wget curl nano vim zsh tmux screen byobu ssh openssh-server \
  gettext locales sudo gnupg expect-dev uuid-dev inotify-tools iwatch locate zip time realpath gperf \
  python-ctypeslib python-docutils python-pygments python-gnutls python-pip \
  texinfo texi2html protobuf-compiler recode 

# For locate command
updatedb  

# No passwoord
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Setup ssh server
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
