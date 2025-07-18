set -e

VERSION=$(readlink /boot/kernel|sed 's/^[^0-9]\+-//'|sed 's/-gentoo\(-dist\)\?//')
sed -i "s/__VERSION__/$VERSION/g" /boot/grub/grub.cfg /etc/os-release
mkdir -p /.genpack
echo $VERSION > /.genpack/version