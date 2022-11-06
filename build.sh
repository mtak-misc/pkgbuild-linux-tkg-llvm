#!/bin/sh
pacman -Syu --noconfirm base-devel sudo git jq curl unzip
curl -sLJO -H 'Accept: application/octet-stream' \
"https://$GITHUB_TOKEN@api.github.com/repos/mtak-misc/pkgbuild-llvm-git/releases/assets/$( \
curl -sL https://$GITHUB_TOKEN@api.github.com/repos/mtak-misc/pkgbuild-llvm-git/releases/tags/test \
| jq '.assets[] | select(.name | contains("llvm")) | .id')" -o llvm-git.zip
unzip llvm-git.zip
pacman --noconfirm -U llvm-git*.pkg.tar.zst llvm-libs-git*.pkg.tar.zst
useradd builder -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chown builder -R /workspace
chown builder -R /tmp
cd /workspace/linux-tkg ; su builder -c "yes '' | makepkg --noconfirm -sc"
