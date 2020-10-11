#!/bin/sh
CURRENT=$(uname -m)

if [ "armv7l" = "$CURRENT" ]; then
    echo "arm"
elif [ "armhf" = "$CURRENT" ]; then
    echo "armhf"
elif [ "aarch64" = "$CURRENT" ]; then
    echo "aarch64"
elif [ "386" = "$CURRENT" ]; then
    echo "i386"
fi

echo "x86_64"
