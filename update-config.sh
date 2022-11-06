#!/bin/sh
curl -LO https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config
NEWCONFIG=$(/usr/bin/sha256sum config | /usr/bin/awk '{print $1}')
OLDCONFIG=$(/usr/bin/sha256sum config.x86_64 | /usr/bin/awk '{print $1}')

echo "-i 's/"$OLDCONFIG"/"$NEWCONFIG"/' ../../PKGBUILD" | /usr/bin/xargs /usr/bin/sed
mv config config.x86_64
