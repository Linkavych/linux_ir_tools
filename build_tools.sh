#!/bin/bash
#==============================================================================#
#
#   FILE: build_tools.sh
#                   
#   USAGE: ./build_tools.sh
#                   
#   DESCRIPTION: Build forensics tools and libraries using vagrant on Debian; 
#                compress them to a tar.xz and copy them to the $PWD; destroy 
#                the vagrant machine on exit
#
#   AUTHOR: Adam V. Link (linkavych)
#   CREATED: 2023-07-06
#   MODIFIED: --
#   VERSION: 1.0
#
#   LICENSE: BSD 3-Clause (copy in repo)
#==============================================================================#
# Execute this script from within the directory with the Vagrantfile

vagrant up

# Create checksums
sleep 1

find data/ -type f -exec sha256sum {} \; | sort -k2 > checksums.txt

#tar cJf 4n6_binaries.tar.xz data/bin data/sbin data/lib data/lib64 checksums.txt note.txt

sleep 1

echo "[+] Completed building binaries for forensic analysis!"
echo "[+] Destroying vagrant vm..."

vagrant destroy

echo "[+] Cleanup complete!"

exit

