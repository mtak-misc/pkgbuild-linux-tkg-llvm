#!/bin/sh
curl -LO https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config
NEWCONFIG=$(/usr/bin/sha256sum config | /usr/bin/awk '{print $1}')
OLDCONFIG=$(/usr/bin/sha256sum config.x86_64 | /usr/bin/awk '{print $1}')

eval "/usr/bin/sed -i 's/"$OLDCONFIG"/"$NEWCONFIG"/' ../../PKGBUILD"
mv config config.x86_64
