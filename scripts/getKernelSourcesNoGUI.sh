#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
# wget -N https://developer.nvidia.com/embedded/dlc/l4t-sources-32-1-JAX-TX2
# wget -N https://developer.nvidia.com/embedded/dlc/l4t-sources-31-1-0
# l4t-sources-31-1-0 is a tbz2 file
wget -N https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jax-tx2/BSP/JAX-TX2-public_sources.tbz2
sudo tar -xvf JAX-TX2-public_sources.tbz2 public_sources/kernel_src.tbz2
tar -xvf public_sources/kernel_src.tbz2
#tar -xvf l4t-sources-32-1-JAX-TX2 public_sources/kernel_src.tbz2
#tar -xvf public_sources/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r public_sources
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

